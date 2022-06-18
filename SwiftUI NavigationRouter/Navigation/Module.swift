//
//  Module.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 12/06/2022.
//

import SwiftUI

enum Module: View, Hashable {
    case empty(EmptyCoordinator)
    case moduleList(ModuleListCoordinator)
    case color(ColorCoordinator)
    case shape(ShapeCoordinator)
    case settings(SettingsCoordinator)
    
    var body: some View {
        switch self {
        case .empty(let coordinator):
            coordinator.body.moduleDestination()
        case .moduleList(let coordinator):
            coordinator.body.moduleDestination()
        case .color(let coordinator):
            coordinator.body.moduleDestination()
        case .shape(let coordinator):
            coordinator.body.moduleDestination()
        case .settings(let coordinator):
            coordinator.body.moduleDestination()
        }
    }
}

extension Module: Identifiable {
    var id: UUID {
        switch self {
        case .empty(let coordinator):
            return coordinator.id
        case .moduleList(let coordinator):
            return coordinator.id
        case .color(let coordinator):
            return coordinator.id
        case .shape(let coordinator):
            return coordinator.id
        case .settings(let coordinator):
            return coordinator.id
        }
    }
}

extension View {
    func moduleDestination() -> some View {
        navigationDestination(for: Module.self) { $0 }
    }
}
