//
//  SwiftUI_NavigationRouterApp.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

@main
struct DemoApp: App {
    @StateObject private var navigationRouter = {
        let router = NavigationRouter()
        let coordinator = ModuleListCoordinator(navigationRouter: router)
        coordinator.start()
        router.setPrimaryModule(.moduleList(coordinator))
        return router
    }()
    
    var body: some Scene {
        WindowGroup {
            NavigationRouterSplitView()
                .environmentObject(navigationRouter)
        }
    }
}
