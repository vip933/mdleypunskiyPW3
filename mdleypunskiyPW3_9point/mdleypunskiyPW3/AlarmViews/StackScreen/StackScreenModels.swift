//
//  StackScreenModels.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

enum StackScreenModels {
    enum Alarms {
        struct Request { }
        struct Response {
            var alarms: [AlarmModel]
        }

        struct ViewModel {
            var alarms: [AlarmModel]
        }

        struct AlarmModel {
            var hour: Int
            var minute: Int
            var isOn: Bool
        }
    }
}
