//
//  StackScreenPresenter.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol StackScreenPresentationLogic {
    typealias Alarm = StackScreenModels.Alarms
    func presentAlarms(response: Alarm.Response)
}

final class StackScreenPresenter: StackScreenPresentationLogic {
    weak var viewController: StackScreenDisplayLogic?
    func presentAlarms(response: Alarm.Response) {
        viewController?.displayAlarms(viewModel: Alarm.ViewModel(alarms: response.alarms))
    }
}
