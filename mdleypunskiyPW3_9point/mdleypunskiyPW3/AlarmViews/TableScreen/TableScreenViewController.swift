//
//  TableViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//
import UIKit

protocol TableScreenDisplayLogic: AnyObject {
    typealias Alarm = TableScreenModels.Alarms
    func displayAlarms(viewModel: Alarm.ViewModel)
}

class TableScreenViewController: UIViewController {
    var interactor: TableScreenBuisnessLogic?
    
    private let table = UITableView(frame: .zero)
    private var alarms: [AlarmView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from table")
        view.backgroundColor = .blue
        SetupTableView()
        interactor?.loadAlarms(request: .init())
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
        cell?.setup(view: alarms[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

extension TableScreenViewController: TableScreenDisplayLogic {
    func displayAlarms(viewModel: Alarm.ViewModel) {
        for alarm in viewModel.alarms {
            alarms.append(AlarmView(alarm.hour, alarm.minute))
        }
        table.reloadData()
    }
}
