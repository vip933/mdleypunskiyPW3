//
//  AlarmView.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

class AlarmView: UIView {
    
    let timeLabel = UILabel()
    let toggle = UISwitch()
    var hours: Int32?
    var minutes: Int32?
    
    convenience init(_ hours: Int32 = 0, _ minutes: Int32 = 0) {
        self.init()
        self.hours = hours
        self.minutes = minutes
        setup()
    }
    
    private func setup() {
        print("hello from AlarmView")
        self.backgroundColor = .systemGray
        addSubview(timeLabel)
        addSubview(toggle)
        
        let hoursStr = self.hours ?? 0 < 10 ? "0" + String(self.hours ?? 0) : String(self.hours ?? 0)
        let minutesStr = self.minutes ?? 0 < 10 ? "0" + String(self.minutes ?? 0) : String(self.minutes ?? 0)
        timeLabel.text = hoursStr + ":" + minutesStr
        
        timeLabel.pinTop(to: self, 15)
        timeLabel.pinLeft(to: self, 10)
        toggle.pinTop(to: self, 7)
        toggle.pinRight(to: self, 10)
        setHeight(to: 50)
    }
}
