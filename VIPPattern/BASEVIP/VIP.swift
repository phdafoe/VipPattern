//
//  VIP.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation

// MARK: - VIP
public protocol BasePresenteProtocol: PresenterInteractorProtocol {
    associatedtype BaseInteractorProtocol
    var interactor: BaseInteractorProtocol! { get set }
}

public protocol BaseInteractorProtocol: InteractorPresenterProtocol {
    associatedtype BasePresenteProtocol
    var presenter: BasePresenteProtocol! { get set }
}

// MARK: - Input/Output
public protocol PresenterInteractorProtocol: class {}
public protocol InteractorPresenterProtocol: class {}

// MARK: - Coordinator
public protocol ModuleCoordinator {
    associatedtype Presenter where Presenter: BasePresenteProtocol
    associatedtype Interactor where Interactor: BaseInteractorProtocol
    func coordinator(presenter: Presenter, interactor: Interactor)
}

public extension ModuleCoordinator{
    func coordinator(presenter: Presenter, interactor: Interactor) {
        presenter.interactor = (interactor as? Self.Presenter.BaseInteractorProtocol)
        interactor.presenter = (presenter as? Self.Interactor.BasePresenteProtocol)
    }
}

