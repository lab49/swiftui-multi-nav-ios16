//
//  NavigationCoordinator.swift
//  Veritask
//
//  Created by Joseph McSorley on 2/19/24.
//

import SwiftUI

class NavigationCoordinator<S: NavigationScreenDefinition>: ObservableObject {
    @Published var navStack = [S]() {
        willSet {
            handleNavStackUpdate(oldStack: navStack, newStack: newValue)
        }
    }
    @Published var isPoppingToRoot = false
    private var observablesDict: [S: any ObservableObject] = [:]
    @Published var isErrorPresented = false
    private(set) var errorMessage = ""
    private(set) var errorAlertCallback: () -> Void = {}
    
    @ViewBuilder
    func navigate(to screen: S) -> some View {
        if screen != .root && !navStack.contains(screen) {
            EmptyView()
        } else {
            screen.screenView(navCoordinator: self)
        }
    }
    
    func push(_ screen: S) {
        navStack.append(screen)
    }
    
    func pop() {
        navStack.removeLast()
    }

    func popToRoot() {
        navStack.removeAll()
    }
    
    func jumpTo(_ navStack: [S]) {
        self.navStack = navStack
    }
    
    func presentErrorAlert(_ errorMessage: String, callback: @escaping () -> Void = {}) {
        self.errorMessage = errorMessage
        self.errorAlertCallback = {
            callback()
            self.errorMessage = ""
            self.errorAlertCallback = {}
        }
        isErrorPresented = true
    }

    func observable<T: ObservableObject>(for screen: S, default defaultValue: @autoclosure () -> T) -> T {
        if let observable = observablesDict[screen] as? T {
            return observable
        }
        let observable = defaultValue()
        register(observable, for: screen)
        return observable
    }

    private func register(_ newObservable: any ObservableObject, for screen: S) {
        observablesDict[screen] = newObservable
    }
    
    private func handleNavStackUpdate(oldStack: [S], newStack: [S]) {
        let removedScreens = Set(oldStack).subtracting(Set(newStack))
        removedScreens.forEach { observablesDict.removeValue(forKey: $0) }
    }
}

protocol NavigationScreenDefinition: Hashable {
    associatedtype V: View
    static var root: Self { get }
    func screenView(navCoordinator: NavigationCoordinator<Self>) -> V
}

struct NavigationRootView<S: NavigationScreenDefinition>: View {
    let navCoordinator: NavigationCoordinator<S>
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        @ObservedObject var navCoordinator = navCoordinator
        return NavigationStack(path: $navCoordinator.navStack) {
            navCoordinator.navigate(to: S.root)
                .navigationDestination(for: S.self) { screen in
                    return navCoordinator.navigate(to: screen)
                }
        }
        
    }
}
