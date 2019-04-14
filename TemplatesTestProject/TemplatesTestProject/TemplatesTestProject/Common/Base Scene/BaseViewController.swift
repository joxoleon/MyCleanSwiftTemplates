//
//  BaseViewController.swift
//  CleanSwiftTestProject
//
//  Created by Jovan on 4/13/19.
//  Copyright (c) 2019 Jovan. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, DisplayLogic, CleanViewController {

    // MARK: - Scene Component Properties
    var baseConfigurator: ConfiguratorLogic?
    var baseInteractor: BusinessLogic?
    var baseRouter: RouterInput?

    // MARK: - Object Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        baseInteractor?.businessLogicOnViewWillAppear()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        baseInteractor?.businessLogicOnViewWillAppear()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.isMovingFromParent {
            baseRouter?.passDataToPreviousScene()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        baseRouter?.passDataToNextScene(segue: segue)
    }
}
