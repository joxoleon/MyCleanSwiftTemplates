//
//  MarkerProtocols.swift
//  TemplatesTest
//
//  Created by Jovan Radivojsa on 4/12/19.
//  Copyright © 2019 Jovan Radivojsa. All rights reserved.
//

import Foundation
import UIKit

/*
I think it would be beneficial to have marker protocols for clean scene templates in case some functionality could be abstracted or added in the future.
 */

// MARK: Data Definitnions
typealias ChildVCClosingHandler = (DataStore) -> ()
typealias RouterInput = RoutingNavigation & DataPassing

// MARK: Configurator

protocol ConfiguratorLogic: class {
    func configure(_ viewController: BaseViewController)
}

// MARK: ViewContorller

protocol DisplayLogic: class {
}

protocol CleanViewController: DisplayLogic {
    var baseConfigurator: ConfiguratorLogic? { get set }
    var baseInteractor: BusinessLogic? { get set }
    var baseRouter: RouterInput? { get set }
}

// MARK: Interactor

protocol DataStore: class {
    func onBaseChildViewControllerClosing(childDataStore: DataStore)
}

protocol BusinessLogic: class {
    func businessLogicOnViewDidLoad()
    func businessLogicOnViewWillAppear()
}

protocol Interactor: class {
    var basePresenter: PresentationLogic? { get set }
    var baseWorker: WorkerLogic? { get set }
}

// MARK: Presenter

protocol PresentationLogic: class {
}

protocol Presenter: class {
    var baseViewController: DisplayLogic? { get set }
}

// MARK: Router

protocol RoutingNavigation: class {
}

protocol DataPassing: class {
    var basePreviousSceneReceiveDataClosure: ChildVCClosingHandler? { get set }
    func passDataToPreviousScene()
    func passDataToNextScene(segue: UIStoryboardSegue)
}

protocol Router: class {
    var baseDataStore: DataStore? { get set }
    var baseViewController: ViewController? { get set }
    var basePreviousSceneReceiveDataClosure: ChildVCClosingHandler? { get set }
}

// MARK: Worker

protocol WorkerLogic: class {
}

// MARK: Models

protocol Models {
}

