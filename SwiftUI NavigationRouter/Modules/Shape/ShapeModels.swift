//
//  ShapeModels.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

enum ShapeAction {
    case push(ModuleListViewState.Module)
    case pop
}

class ShapeViewModel: ObservableObject {
    @Published private var state: ShapeViewState
    var viewState: ShapeViewState { state }
    
    var callback: ((ShapeAction) -> Void)?
    
    init(shape: ShapeViewState.Shape) {
        self.state = ShapeViewState(shape: shape)
    }
    
    func randomShape() {
        state.shape = ShapeViewState.Shape.allCases.filter { $0 != state.shape }.randomElement() ?? .square
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

struct ShapeViewState {
    enum Shape: String, CaseIterable { case square, squircle, circle }
    
    var shape: Shape
    
    let size: CGFloat = 220
    
    @ViewBuilder
    var container: some View {
        switch shape {
        case .square:
            Rectangle()
        case .squircle:
            RoundedRectangle(cornerRadius: size / 2.5, style: .continuous)
        case .circle:
            Circle()
        }
    }
}
