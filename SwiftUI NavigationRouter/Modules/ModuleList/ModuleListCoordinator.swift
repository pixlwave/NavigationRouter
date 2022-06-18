//
//  ColorCoordinator.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

final class ModuleListCoordinator: NSObject, Coordinator, View {
    let id = UUID()
    
    private let viewModel: ModuleListViewModel
    private weak var navigationRouter: NavigationRouter?
    
    var callback: (() -> Void)?
    
    init(navigationRouter: NavigationRouter?) {
        self.viewModel = ModuleListViewModel()
        self.navigationRouter = navigationRouter
    }
    
    func start() {
        viewModel.callback = { [weak self] action in
            guard let self = self else { return }
            
            switch action {
            case .select(let module):
                self.updateSelection(module)
            case .settings:
                self.showSettings()
            }
        }
    }
    
    var body: some View {
        ModuleListView(viewModel: viewModel)
    }
    
    // MARK: - Private
    
    private func updateSelection(_ module: ModuleListViewState.Module?) {
        guard let module = module else {
            self.clearStack()
            return
        }
        
        switch module {
        case .color:
            self.showColor()
        case .shape:
            self.showShape()
        }
    }
    
    private func clearStack() {
    }
    
    private func showColor() {
        let coordinator = ColorCoordinator(navigationRouter: navigationRouter)
        let module = Module.color(coordinator)
        
        coordinator.start()
        
        navigationRouter?.setSecondaryRootModule(module)
    }
    
    private func showShape() {
        let coordinator = ShapeCoordinator(navigationRouter: navigationRouter)
        let module = Module.shape(coordinator)
        
        coordinator.start()
        
        navigationRouter?.setSecondaryRootModule(module)
    }
    
    private func showSettings() {
        let coordinator = SettingsCoordinator(navigationRouter: navigationRouter)
        let module = Module.settings(coordinator)
        
        coordinator.start()
        
        navigationRouter?.presentSheet(module)
    }
}
