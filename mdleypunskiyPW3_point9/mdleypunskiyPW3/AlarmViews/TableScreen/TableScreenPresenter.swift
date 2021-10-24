//
//  TableScreenPresenter.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol TableScreenPresentationLogic {
    typealias Alarm = TableScreenModels.Alarms
    func presentAlarms(response: Alarm.Response)
}

final class TableScreenPresenter: TableScreenPresentationLogic {
    weak var viewController: TableScreenDisplayLogic?
    func presentAlarms(response: Alarm.Response) {
        viewController?.displayAlarms(viewModel: Alarm.ViewModel(alarms: response.alarms))
    }
}

