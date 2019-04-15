//
//  TestRouter.swift
//  TemplatesTestProject
//
//  Created by Jovan on 4/14/19.
//  Copyright (c) 2019 Jovan. All rights reserved.
//
//  This file was 'partially' generated by the 'Component Based Clean Swift Templates' created by Jovan Radivojsa (a.k.a. joxoleon)
//  Based on the clean swift templates created by Raymond Law: http://clean-swift.com
//

import UIKit

protocol TestRoutingNavigation: RoutingNavigation {
    func showNewScreen()
}

protocol TestDataPassing: DataPassing {}

typealias TestRouterInput = TestRoutingNavigation & TestDataPassing

class TestRouter: BaseRouter, TestRouterInput {
    
    private struct Segues {
        static let ShowNextScreenIdentifier = ""
    }

    // MARK: - Scene Components
    var dataStore: TestDataStore? {
        return baseDataStore as? TestDataStore
    }
    weak var viewController: TestViewController? {
        return baseViewController as? TestViewController
    }

    // MARK: - Properties
    // var isSomething: Bool = true

    // MARK: Navigation

    func showNewScreen() {
        performSegueWithIdentifier(segueId: Segues.ShowNextScreenIdentifier)
    }

    // MARK: Passing data

    override func passDataToNextScene(segue: UIStoryboardSegue) {
        if segue.identifier == Segues.ShowNextScreenIdentifier {
            // Pass Relevant Data
        }
    }
}
