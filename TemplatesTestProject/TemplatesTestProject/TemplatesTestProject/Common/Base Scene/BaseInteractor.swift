//
//  BaseInteractor.swift
//  CleanSwiftTestProject
//
//  Created by Jovan on 4/13/19.
//  Copyright (c) 2019 Jovan. All rights reserved.
//

import UIKit

class BaseInteractor: BusinessLogic, DataStore {

    // MARK: - Scene Component Properties
    var basePresenter: PresentationLogic?
    var baseWorker: WorkerLogic?

    // MARK: - Base Methods

    func onBaseChildViewControllerClosing(childDataStore: DataStore) {
        // Use 'childDataStore' to extract necessary data from the closing child view controller.
    }

    func businessLogicOnViewDidLoad() { /* Override in concrete interactor */}

    func businessLogicOnViewWillAppear() { /* Override in concrete interactor */ }
}