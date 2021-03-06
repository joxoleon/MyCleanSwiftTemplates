//
//  BaseViewController.swift
//  CleanSwiftTestProject
//
//  Created by Jovan on 4/13/19.
//  Copyright (c) 2019 Jovan. All rights reserved.
//

import UIKit

protocol DisplayLogic: class {
}

protocol CleanViewController: DisplayLogic {
    var baseConfigurator: ConfiguratorLogic? { get set }
    var baseInteractor: BusinessLogic? { get set }
    var baseRouter: RouterInput? { get set }
}

class BaseViewController: UIViewController, DisplayLogic, CleanViewController {

    // MARK: - Scene Component Properties
    var baseConfigurator: ConfiguratorLogic?
    var baseInteractor: BusinessLogic?
    var baseRouter: RouterInput?

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onViewWillAppear()
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

    func onViewDidLoad() { /* Override in concrete view controller */ }

    func onViewWillAppear() { /* Override in concrete view controller */ }
}
