//
//  ColorView.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: SettingsViewModel
    @State var selection: Module?
    
    var body: some View {
        Form {
            Picker("Default Color", selection: $viewModel.defaultColor) {
                ForEach(ColorViewState.Color.allCases, id: \.self) { color in
                    Text(color.rawValue).tag(color)
                }
            }
            Picker("Default Shape", selection: $viewModel.defaultShape) {
                ForEach(ShapeViewState.Shape.allCases, id: \.self) { shape in
                    Text(shape.rawValue).tag(shape)
                }
            }
        }
        .navigationTitle("Settings")
    }
}
