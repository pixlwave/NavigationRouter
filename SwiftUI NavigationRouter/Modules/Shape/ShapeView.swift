//
//  ShapeView.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

struct ShapeView: View {
    @ObservedObject var viewModel: ShapeViewModel
    
    var body: some View {
        ZStack {
            viewModel.viewState.container
                .frame(width: viewModel.viewState.size, height: viewModel.viewState.size)
                .foregroundStyle(.orange.opacity(0.5))
            
            buttons
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Shape: \(viewModel.viewState.shape.rawValue)")
    }
    
    var buttons: some View {
        VStack {
            Button("Push Shape", action: viewModel.pushShape)
                .foregroundStyle(.black.opacity(0.75))
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            
            Button("Change Shape", action: viewModel.randomShape)
                .foregroundStyle(.black.opacity(0.75))
                .buttonStyle(.bordered)
                .padding(.bottom, 6)
            
            Button("Push Color", action: viewModel.pushColor)
                .foregroundStyle(.black.opacity(0.75))
                .buttonStyle(.bordered)
        }
        .tint(.white)
    }
}
