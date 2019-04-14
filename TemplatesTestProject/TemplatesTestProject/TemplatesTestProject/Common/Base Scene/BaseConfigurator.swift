//
//  BaseConfigurator.swift
//  CleanSwiftTestProject
//
//  Created by Jovan on 4/13/19.
//  Copyright (c) 2019 Jovan. All rights reserved.
//

import UIKit

protocol ConfiguratorLogic: class {
    func configure(_ viewController: BaseViewController)
}

// Connects View, Interactor, and Presenter
class BaseConfigurator: ConfiguratorLogic {

    // MARK: - Scene Component Properties
    weak var baseViewController: BaseViewController?
    weak var baseInteractor: BaseInteractor? {
        didSet {
            // Set interactor references
            baseInteractor?.basePresenter = basePresenter
            // Set references to interactor
            baseViewController?.baseInteractor = baseInteractor
            baseRouter?.baseDataStore = baseInteractor
        }
    }
    weak var basePresenter: BasePresenter? {
        didSet {
            // Set presenter references
            basePresenter?.baseViewController = baseViewController
            // Set references to presenter
            baseInteractor?.basePresenter = basePresenter
        }
    }
    weak var baseRouter: BaseRouter? {
        didSet {
            // Set router references
            baseRouter?.baseViewController = baseViewController
            baseRouter?.baseDataStore = baseInteractor
            // Set references to router
            baseViewController?.baseRouter = baseRouter
        }
    }
    weak var baseWorker: BaseWorker? {
        didSet {
            // Set references to worker
            baseInteractor?.baseWorker = baseWorker
        }
    }

    // MARK: - Configuration

    func configure(_ viewController: BaseViewController) {
        assertionFailure("This method should always be called from the child class, do not call super.configure(_)")
    }
}
