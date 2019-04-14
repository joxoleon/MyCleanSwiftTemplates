//
//  BasePresenter.swift
//  CleanSwiftTestProject
//
//  Created by Jovan on 4/13/19.
//  Copyright (c) 2019 Jovan. All rights reserved.
//

import UIKit

protocol PresentationLogic: class {
}

protocol Presenter: class {
    var baseViewController: DisplayLogic? { get set }
}

class BasePresenter: PresentationLogic {
    
    // MARK: - Scene Component Properties
    var baseViewController: DisplayLogic?
}
