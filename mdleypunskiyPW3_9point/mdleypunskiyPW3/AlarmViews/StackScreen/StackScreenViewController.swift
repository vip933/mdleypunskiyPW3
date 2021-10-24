//
//  StackViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

protocol StackScreenDisplayLogic: AnyObject {
    typealias Alarm = StackScreenModels.Alarms
    func displayAlarms(viewModel: Alarm.ViewModel)
}

class StackScreenViewController: UIViewController {
    var interactor: StackScreenBuisnessLogic?
    
    private var stack = UIStackView()
    private var scroll = UIScrollView()
    private var alarms: [AlarmView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from stack")
        view.backgroundColor = .white
        SetupScroll()           
        SetupStackView()
        interactor?.loadAlarms(request: .init())
        SetupViews()
    }
    
    private func SetupScroll() {
        view.addSubview(scroll)
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        scroll.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scroll.pin(to: view, .left, .right)
    }
    
    private func SetupStackView() {
        let stack = UIStackView()
    
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 1
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.pin(to: scroll)
        self.stack = stack
    }
    
    private func SetupViews() {
        for alarm in alarms {
            stack.addArrangedSubview(alarm)
            alarm.pinWidth(to: scroll.widthAnchor)
        }
    }
}

extension StackScreenViewController: StackScreenDisplayLogic {
    func displayAlarms(viewModel: Alarm.ViewModel) {
        for alarm in viewModel.alarms {
            alarms.append(AlarmView(alarm.hour, alarm.minute))
        }
    }
}
