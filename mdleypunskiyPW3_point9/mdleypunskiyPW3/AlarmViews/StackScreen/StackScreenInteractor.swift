//
//  StackScreenInteractor.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol StackScreenBuisnessLogic: AnyObject {
    typealias AlarmModel = StackScreenModels.Alarms.AlarmModel
    func loadAlarms(request: StackScreenModels.Alarms.Request)
}

final class StackScreenInteractor: StackScreenBuisnessLogic {
    
    var presenter: StackScreenPresentationLogic?
    
    func loadAlarms(request: StackScreenModels.Alarms.Request) {
        var alarms: [StackScreenModels.Alarms.AlarmModel] = []
        for _ in 0...200 {
            alarms.append(
                AlarmModel(
                    hour: Int.random(in: 0...23),
                    minute: Int.random(in: 0...59),
                    isOn: Bool.random()
                )
            )
        }
        alarms.sort { $0.hour*60 + $0.minute < $1.hour*60 + $1.minute}
        presenter?.presentAlarms(response: StackScreenModels.Alarms.Response(alarms: alarms))
    }
}
