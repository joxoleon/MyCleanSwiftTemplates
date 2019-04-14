//
//  BaseRouter.swift
//  CleanSwiftTestProject
//
//  Created by Jovan on 4/13/19.
//  Copyright (c) 2019 Jovan. All rights reserved.
//

import UIKit

typealias ChildVCClosingHandler = (DataStore) -> ()
typealias RouterInput = RoutingNavigation & DataPassing

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

class BaseRouter: RouterInput {

    // MARK: - Scene Components
    var baseDataStore: DataStore?
    weak var baseViewController: UIViewController?
    var basePreviousSceneReceiveDataClosure: ChildVCClosingHandler?

    // MARK: Navigation
    
    func performSegueWithIdentifier(segueId: String) {
        baseViewController?.performSegue(withIdentifier: segueId, sender: nil)
    }
    
    // MARK: Passing data

    func passDataToNextScene(segue: UIStoryboardSegue) {
        if let destinationViewController = segue.destination as? BaseViewController {
            destinationViewController.baseRouter?.basePreviousSceneReceiveDataClosure = baseDataStore?.onBaseChildViewControllerClosing
        }
    }

    func passDataToPreviousScene() {
        guard let dataStore = baseDataStore else {
            assertionFailure("Not Properly connected")
            return
        }
        // When closing pass data store to current scene
        basePreviousSceneReceiveDataClosure?(dataStore)
    }
}
