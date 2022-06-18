//
//  ShapeCoordinator.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

final class ShapeCoordinator: NSObject, Coordinator, View {
    let id = UUID()
    
    private let viewModel: ShapeViewModel
    private weak var navigationRouter: NavigationRouter?
    
    var callback: (() -> Void)?
    
    init(navigationRouter: NavigationRouter?, initialShape: ShapeViewState.Shape? = nil) {
        self.viewModel = ShapeViewModel(shape: initialShape ?? .square)
        self.navigationRouter = navigationRouter
    }
    
    func start() {
        viewModel.callback = { [weak self] action in
            guard let self = self else { return }
            
            switch action {
            case .push(let module):
                if module == .color {
                    self.pushColor()
                } else {
                    self.pushShape()
                }
            case .pop:
                self.pop()
            }
        }
    }
    
    var body: some View {
        ShapeView(viewModel: viewModel)
    }
    
    // MARK: - Private
    
    private func pushColor() {
        let color = ColorViewState.Color.allCases.randomElement() ?? .red
        let coordinator = ColorCoordinator(navigationRouter: navigationRouter, initialColor: color)
        let module = Module.color(coordinator)
        
        coordinator.start()
        
        navigationRouter?.push(module)
    }
    
    private func pushShape() {
        let shape = ShapeViewState.Shape.allCases.filter { $0 != viewModel.viewState.shape }.randomElement() ?? .square
        let coordinator = ShapeCoordinator(navigationRouter: navigationRouter, initialShape: shape)
        let module = Module.shape(coordinator)
        
        coordinator.start()
        
        navigationRouter?.push(module)
    }
    
    private func pop() {
        callback?()
    }
}
