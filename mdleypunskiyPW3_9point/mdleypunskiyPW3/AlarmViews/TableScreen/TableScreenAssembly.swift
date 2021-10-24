//
//  TableScreenAssembly.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

final class TableScreenAssembly {
    static func build() -> UIViewController {
        let vc = TableScreenViewController()
        let interactor = TableScreenInteractor()
        let presenter = TableScreenPresenter()
        presenter.viewController = vc
        interactor.presenter = presenter
        vc.interactor = interactor
        return vc
    }
}
