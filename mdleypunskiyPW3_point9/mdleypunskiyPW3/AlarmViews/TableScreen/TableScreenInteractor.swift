//
//  TableScreenInteractor.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol TableScreenBuisnessLogic: AnyObject {
    typealias AlarmModel = TableScreenModels.Alarms.AlarmModel
    func loadAlarms(request: TableScreenModels.Alarms.Request)
}

final class TableScreenInteractor: TableScreenBuisnessLogic {
    
    var presenter: TableScreenPresentationLogic?
    
    func loadAlarms(request: TableScreenModels.Alarms.Request) {
        var alarms: [TableScreenModels.Alarms.AlarmModel] = []
        for _ in 0...200 {
            alarms.append(
                AlarmModel(
                    hour: Int.random(in: 0...23),
                    minute: Int.random(in: 0...59),
                    isOn: Bool.random()
                )
            )
        }
        alarms.sort { $0.hour*60 + $0.minute  < $1.hour*60 + $1.minute}
        presenter?.presentAlarms(response: TableScreenModels.Alarms.Response(alarms: alarms))
    }
}
