//
//  NavSwiftUIiOS16App.swift
//  NavSwiftUIiOS16
//
//  Created by Joseph McSorley on 3/30/24.
//

import SwiftUI

@main
struct NavSwiftUIiOS16App: App {
    @StateObject private var appNavCoordinator = NavigationCoordinator<AppScreens>()
    
    var body: some Scene {
        WindowGroup {
            NavigationRootView(navCoordinator: appNavCoordinator)
                .alert("Something went wrong", isPresented: $appNavCoordinator.isErrorPresented) {
                    Button("Ok", role: .cancel) { appNavCoordinator.errorAlertCallback() }
                } message: {
                    Text(appNavCoordinator.errorMessage)
                }
                .environmentObject(appNavCoordinator)
        }
    }
}
