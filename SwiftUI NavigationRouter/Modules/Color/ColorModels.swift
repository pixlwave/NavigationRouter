//
//  ColorModels.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

enum ColorAction {
    case push(ModuleListViewState.Module)
    case pop
}

class ColorViewModel: ObservableObject {
    @Published private var state: ColorViewState
    var viewState: ColorViewState { state }
    
    var callback: ((ColorAction) -> Void)?
    
    init(color: ColorViewState.Color) {
        self.state = ColorViewState(color: color)
    }
    
    func randomColor() {
        state.color = ColorViewState.Color.allCases.filter { $0 != state.color }.randomElement() ?? .red
    }
    
    func pushColor() {
        callback?(.push(.color))
    }
    
    func pushShape() {
        callback?(.push(.shape))
    }
        
    func complete() {
        callback?(.pop)
    }
}

struct ColorViewState {
    enum Color: String, CaseIterable { case red, orange, yellow, green, blue, indigo, purple }
    
    var color: Color
    
    var backgroundColor: SwiftUI.Color {
        switch color {
        case .red:
            return .red
        case .orange:
            return .orange
        case .yellow:
            return .yellow
        case .green:
            return .green
        case .blue:
            return .blue
        case .indigo:
            return .indigo
        case .purple:
            return .purple
        }
    }
}
