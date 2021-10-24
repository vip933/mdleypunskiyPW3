//
//  StackScreenAssembly.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

final class StackScreenAssembly {
    static func build() -> UIViewController {
        let vc = StackScreenViewController()
        let interactor = StackScreenInteractor()
        let presenter = StackScreenPresenter()
        presenter.viewController = vc
        interactor.presenter = presenter
        vc.interactor = interactor
        return vc
    }
}
