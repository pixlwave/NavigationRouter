//
//  ColorModels.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

enum ModuleListAction {
    case select(ModuleListViewState.Module?)
    case settings
}

class ModuleListViewModel: ObservableObject {
    @Published var state = ModuleListViewState() {
        didSet { callback?(.select(state.selection)) }
    }
    
    var callback: ((ModuleListAction) -> Void)?
    
    func onSettingsTap() {
        callback?(.settings)
    }
}

struct ModuleListViewState {
    var selection: Module?
    
    enum Module: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        case color, shape
    }
}
