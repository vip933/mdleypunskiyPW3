//
//  CollectionScreenPresenter.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol CollectionScreenPresentationLogic {
    typealias Alarm = CollectionScreenModels.Alarms
    func presentAlarms(response: Alarm.Response)
}

final class CollectionScreenPresenter: CollectionScreenPresentationLogic {
    weak var viewController: CollectionScreenDisplayLogic?
    func presentAlarms(response: Alarm.Response) {
        viewController?.displayAlarms(viewModel: Alarm.ViewModel(alarms: response.alarms))
    }
}
