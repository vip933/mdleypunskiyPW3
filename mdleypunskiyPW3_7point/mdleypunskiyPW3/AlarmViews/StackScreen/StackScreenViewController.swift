//
//  StackViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

class StackScreenViewController: UIViewController {
    
    private var stack = UIStackView()
    private var scroll = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from stack")
        view.backgroundColor = .white
        SetupScroll()
        SetupStackView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll.contentSize = CGSize(
            width: self.view.frame.width,
            height: (stack.frame.height)
        )
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
        
        for _ in 0..<50 {
            let hours = Int32.random(in: 0...23)
            let minutes = Int32.random(in: 0...59)
            let alarm = AlarmView(hours, minutes)
            stack.addArrangedSubview(alarm)
            alarm.pinWidth(to: scroll.widthAnchor)
        }
    }
}
