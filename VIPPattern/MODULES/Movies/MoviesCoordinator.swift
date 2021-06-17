//
//  MoviesCoordinator.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation
import SwiftUI

final class MoviesCoordinator: ModuleCoordinator {
    
    typealias ContentView = MoviesView
    typealias Presenter = MoviesPresenterImpl
    typealias Interactor = MoviesInteractorImpl
    
    func navigationBuild() -> NavigationView<ContentView> {
        NavigationView{
           build()
        }
    }
    
    func build() -> ContentView {
        let presenter = Presenter()
        let interactor = Interactor()
        let view = ContentView(presenter: presenter)
        self.coordinator(presenter: presenter, interactor: interactor)
        return view
    }
}
