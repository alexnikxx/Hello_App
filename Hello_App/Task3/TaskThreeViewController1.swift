//
//  TaskThreeViewController1.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 11/04/24.
//

import UIKit

final class TaskThreeViewController1: UIViewController {
    private var delegate: T3VC1Delegate?

    init(delegate: T3VC1Delegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Введите имя:"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Ваше имя"
        text.text = "Алекс"
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.addTarget(self, action: #selector(nameWasEntered), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)

        setupView()
    }

    @objc private func nameWasEntered() {
        delegate?.delegate(name: textField.text ?? "Алекс")
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300),

            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10),

            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 50)
        ])
    }
}
