//
//  TaskThreeViewController2.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 11/04/24.
//

import UIKit

final class TaskThreeViewController2: UIViewController, T3VC1Delegate, T3VC3Delegate {
    private var name = "Бродяга"
    private var greeting = "Здарова"

    private var label: UILabel = {
        var label = UILabel()
        label.text = "Привет, Алекс"
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

    func delegate(name: String) {
        label.text = "\(greeting), \(name)"
    }

    func delegate(greeting: String) {
        label.text = "\(greeting), \(name)"
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
