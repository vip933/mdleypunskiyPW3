//
//  CollectionViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

class CollectionScreenViewController: UIViewController {
    
    private var alarms: [AlarmView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from collection")
        view.backgroundColor = .blue
        setupCollectionView()
        setupAlarms()
    }
    
    private func setupAlarms() {
        for _ in 0...200 {
            let hours = Int32.random(in: 0...23)
            let minutes = Int32.random(in: 0...59)
            alarms.append(AlarmView(hours, minutes))
        }
        alarms.sort {
            $0.time  < $1.time
        }
    }
    
    private func setupCollectionView() {
        let layoutFlow = UICollectionViewFlowLayout()
        layoutFlow.itemSize = CGSize(width: view.frame.width, height: 50)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layoutFlow)
        view.addSubview(collection)
        collection.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        collection.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collection.pin(to: view, .left, .right)
        collection.backgroundColor = .green
        collection.register(AlarmCollectionCell.self, forCellWithReuseIdentifier: "alarmCollectionCell")
        collection.delegate = self
        collection.dataSource = self
    }
}

extension CollectionScreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfRowsInSection
                    section: Int) -> Int {
        alarms.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
}

extension CollectionScreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        alarms.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "alarmCollectionCell", for: indexPath) as? AlarmCollectionCell
        cell?.setup(view: alarms[indexPath.row])
        return cell ?? UICollectionViewCell()
    }
}
