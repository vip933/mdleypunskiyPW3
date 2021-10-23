//
//  TableViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

class TableScreenViewController: UIViewController {
    
    private var table: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from table")
        view.backgroundColor = .blue
        SetupTableView()
    }
    
    private func SetupTableView() {
        let table = UITableView(frame: .zero)
        view.addSubview(table)
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        table.pin(to: view, .left, .right)
        table.backgroundColor = .systemPink
        self.table = table
    }
}
