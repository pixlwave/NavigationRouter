//
//  Coordinator.swift
//  SwiftUI NavigationRouter
//
//  Created by Doug on 12/06/2022.
//

import Foundation

protocol Coordinator: AnyObject {
    var id: UUID { get }
    func start()
}
