//
//  AlarmCollectionCell.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 23.10.2021.
//

import UIKit

final class AlarmCollectionCell: UICollectionViewCell {
    func setup(view: AlarmView = AlarmView(-1, -1)) {
        setHeight(to: 50)
        addSubview(view)
        view.pinLeft(to: self)
        view.pinRight(to: self)
    }
    
    override func prepareForReuse() {
        for view in subviews {
            if view is AlarmView {
                view.removeFromSuperview()
            }
        }
    }
}
