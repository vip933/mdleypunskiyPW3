//
//  CollectionScreenInteractor.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol CollectionScreenBuisnessLogic: AnyObject {
    typealias AlarmModel = CollectionScreenModels.Alarms.AlarmModel
    func loadAlarms(request: CollectionScreenModels.Alarms.Request)
}

final class CollectionScreenInteractor: CollectionScreenBuisnessLogic {
    
    var presenter: CollectionScreenPresentationLogic?
    
    func loadAlarms(request: CollectionScreenModels.Alarms.Request) {
        var alarms: [CollectionScreenModels.Alarms.AlarmModel] = []
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
        presenter?.presentAlarms(response: CollectionScreenModels.Alarms.Response(alarms: alarms))
    }
}
