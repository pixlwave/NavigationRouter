//
//  NavigationRouter.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 12/06/2022.
//

import SwiftUI

class NavigationRouter: ObservableObject {
    @Published fileprivate var primaryModule: Module = .empty(EmptyCoordinator())
    @Published fileprivate var secondaryRootModule: Module = .empty(EmptyCoordinator())
    @Published fileprivate var navigationStack = [Module]()
    @Published fileprivate var sheetModule: Module?
    
    func setPrimaryModule(_ module: Module) {
        primaryModule = module
        popToPrimaryModule()
    }
    
    func setSecondaryRootModule(_ module: Module) {
        secondaryRootModule = module
        popToSecondaryModule()
    }
    
    func push(_ module: Module) {
        navigationStack.append(module)
    }
    
    func popToPrimaryModule() {
        secondaryRootModule = .empty(EmptyCoordinator())
        navigationStack = []
    }
    
    func popToSecondaryModule() {
        navigationStack = []
    }
    
    func presentSheet(_ module: Module) {
        sheetModule = module
    }
    
    func dismissSheet() {
        sheetModule = nil
    }
}

struct NavigationRouterSplitView: View {
    @EnvironmentObject private var router: NavigationRouter
    
    var body: some View {
        NavigationSplitView {
            router.primaryModule
        } detail: {
            NavigationStack(path: $router.navigationStack) {
                router.secondaryRootModule
            }
        }
        .sheet(item: $router.sheetModule) { module in
            NavigationStack { module }
        }
    }
}
