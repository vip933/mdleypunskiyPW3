//
//  StackViewController.swift
//  mdleypunskiyPW3
//
//  Created by Maksim on 11.10.2021.
//

import UIKit

class StackScreenViewController: UIViewController {
    
    private var stack: UIStackView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello from stack")
        view.backgroundColor = .white
        SetupStackView()
    }
    
    private func SetupStackView() {
        let stack = UIStackView(frame: .zero)
        view.addSubview(stack)
        stack.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        stack.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        stack.pin(to: view, .left, .right)
        stack.backgroundColor = .green
        self.stack = stack
    }
}
