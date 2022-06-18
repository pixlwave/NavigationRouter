//
//  ColorView.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 18/06/2022.
//

import SwiftUI

struct ModuleListView: View {
    @ObservedObject var viewModel: ModuleListViewModel
    @State var selection: Module?
    
    var body: some View {
        List(selection: $viewModel.state.selection) {
            ForEach(ModuleListViewState.Module.allCases) { module in
                Text(module.rawValue)
                    .tag(module)
            }
        }
        .navigationTitle("Modules")
        .toolbar {
            ToolbarItem {
                Button(action: viewModel.onSettingsTap) {
                    Image(systemName: "gearshape")
                }
            }
        }
    }
}
