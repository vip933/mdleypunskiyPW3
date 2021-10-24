//
//  CollectionScreenAssembly.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

final class CollectionScreenAssembly {
    static func build() -> UIViewController {
        let vc = CollectionScreenViewController()
        let interactor = CollectionScreenInteractor()
        let presenter = CollectionScreenPresenter()
        presenter.viewController = vc
        interactor.presenter = presenter
        vc.interactor = interactor
        return vc
    }
}
