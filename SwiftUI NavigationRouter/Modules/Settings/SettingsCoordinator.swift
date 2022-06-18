//
//  ColorCoordinator.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

final class SettingsCoordinator: NSObject, Coordinator, View {
    let id = UUID()
    
    private let viewModel: SettingsViewModel
    private weak var navigationRouter: NavigationRouter?
    
    var callback: (() -> Void)?
    
    init(navigationRouter: NavigationRouter?) {
        self.viewModel = SettingsViewModel()
        self.navigationRouter = navigationRouter
    }
    
    func start() {
        viewModel.callback = { [weak self] in
            // dismiss
        }
    }
    
    var body: some View {
        SettingsView(viewModel: viewModel)
    }
}
