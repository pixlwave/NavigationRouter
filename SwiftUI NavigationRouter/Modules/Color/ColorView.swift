//
//  ColorView.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

struct ColorView: View {
    @ObservedObject var viewModel: ColorViewModel
    
    var body: some View {
        VStack {
            Button("Push Colour", action: viewModel.pushColor)
                .foregroundStyle(.black.opacity(0.75))
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
            
            Button("Change Colour", action: viewModel.randomColor)
                .foregroundStyle(.black.opacity(0.75))
                .buttonStyle(.bordered)
                .padding(.bottom, 6)
            
            Button("Push Shape", action: viewModel.pushShape)
                .foregroundStyle(.black.opacity(0.75))
                .buttonStyle(.bordered)
        }
        .tint(.white)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(viewModel.viewState.backgroundColor.opacity(0.5), ignoresSafeAreaEdges: .all)
        .navigationTitle("Color: \(viewModel.viewState.color.rawValue)")
    }
}
