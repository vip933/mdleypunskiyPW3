//
//  TableViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

class TableScreenViewController: UIViewController {
    
    private let table = UITableView(frame: .zero)
    private var alarms: [AlarmView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from table")
        view.backgroundColor = .blue
        SetupTableView()
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
    
    private func SetupTableView() {
        view.addSubview(table)
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to: view, .left, .right)
        table.backgroundColor = .systemPink
        table.register(AlarmCell.self, forCellReuseIdentifier: "alarmCell")
        table.delegate = self
        table.dataSource = self
    }
}

extension TableScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection
                    section: Int) -> Int {
        alarms.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

extension TableScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmCell
        //let cell = tableView.dequeueReusableCell(withIdentifier: "eyeCell", for: indexPath) as? EyeCell
        cell?.setup(view: alarms[indexPath.row])
        return cell ?? UITableViewCell()
    }
}
