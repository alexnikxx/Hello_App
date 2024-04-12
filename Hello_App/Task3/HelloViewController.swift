//
//  TaskThreeViewController2.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 11/04/24.
//

import UIKit

final class HelloViewController: UIViewController {
    private let greeting: Greeting

    init(greeting: Greeting) {
        self.greeting = greeting
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 30, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
        label.text = "\(greeting.hello), \(greeting.name)"
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}