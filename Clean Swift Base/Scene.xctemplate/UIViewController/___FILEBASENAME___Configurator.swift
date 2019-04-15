//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was 'partially' generated by the 'Component Based Clean Swift Templates' created by Jovan Radivojsa (a.k.a. joxoleon),
//  Based on the clean swift templates created by Raymond Law: http://clean-swift.com
//

import UIKit

// Connects View, Interactor, and Presenter
class ___VARIABLE_sceneName___Configurator: BaseConfigurator {

    func configure(_ viewController: ___VARIABLE_sceneName___ViewController) {
        // Instantiate scene components.
        let presenter = ___VARIABLE_sceneName___Presenter()
        let worker = ___VARIABLE_sceneName___Worker()
        let interactor = ___VARIABLE_sceneName___Interactor()
        let router = ___VARIABLE_sceneName___Router()

        // Set configurator variables and connect them.
        self.baseViewController = viewController
        self.baseWorker = worker
        self.basePresenter = presenter
        self.baseInteractor = interactor
        self.baseRouter = router
    }
}
