//
//  AlarmCell.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 23.10.2021.
//

import UIKit

final class AlarmCell: UITableViewCell {
    
    func setup(view: AlarmView = AlarmView(-1, -1)) {
        setHeight(to: 50)
        contentView.addSubview(view)
        view.pinLeft(to: contentView)
        view.pinRight(to: contentView)
    }
    
    override func prepareForReuse() {
        for view in subviews {
            if view is AlarmView {
                view.removeFromSuperview()
            }
        }
    }
}
