//
//  ColorModels.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

class SettingsViewModel: ObservableObject {
    var callback: (() -> Void)?
    
    @Published var defaultColor: ColorViewState.Color = .red
    @Published var defaultShape: ShapeViewState.Shape = .square
}
