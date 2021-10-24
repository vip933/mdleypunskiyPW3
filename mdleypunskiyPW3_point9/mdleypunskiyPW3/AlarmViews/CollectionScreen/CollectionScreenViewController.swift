//
//  CollectionViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol CollectionScreenDisplayLogic: AnyObject {
    typealias Alarm = CollectionScreenModels.Alarms
    func displayAlarms(viewModel: Alarm.ViewModel)
}

class CollectionScreenViewController: UIViewController {
    var interactor: CollectionScreenBuisnessLogic?
    
    private var alarms: [AlarmView] = []
    private var collection: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from collection")
        view.backgroundColor = .blue
        setupCollectionView()
        interactor?.loadAlarms(request: .init())
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
        self.collection = collection
    }
}

extension CollectionScreenViewController: UICollectionViewDelegate { }

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

extension CollectionScreenViewController: CollectionScreenDisplayLogic {
    func displayAlarms(viewModel: Alarm.ViewModel) {
        for alarm in viewModel.alarms {
            alarms.append(AlarmView(alarm.hour, alarm.minute))
        }
        collection?.reloadData()
    }
}
