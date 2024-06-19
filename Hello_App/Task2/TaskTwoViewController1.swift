//
//  TaskTwoViewController1.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 05/04/24.
//

import UIKit

final class TaskTwoViewController1: UIViewController, TaskTwoViewController2Delegate {
    func delegate(greeting: String) {
        label.text = greeting
    }

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Привет!"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Изменить заголовок", for: .normal)
        button.addTarget(self, action: #selector(showNextViewController), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(button)

        setupView()
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
            label.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -20),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func showNextViewController() {
        let nextVC = TaskTwoViewController2(delegate: self)
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
