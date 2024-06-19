//
//  EditingViewController.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 19/06/24.
//

import UIKit

final class EditingViewController: UIViewController {
    var textChanger: ((String) -> Void)?

    private let label: UILabel = {
        let label = UILabel()
        label.text = "Измените заголовок:"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите приветствие"
        text.text = "Привет!"
        text.borderStyle = .roundedRect
        text.autocapitalizationType = .none
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    private let buttonSave: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сохранить", for: .normal)
        button.addTarget(self, action: #selector(textDidChange), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let buttonCancel: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отмена", for: .normal)
        button.tintColor = .red
        button.addTarget(self, action: #selector(dismissScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(buttonSave)
        view.addSubview(buttonCancel)
        setupView()
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),

            textField.widthAnchor.constraint(equalToConstant: 300),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),

            buttonSave.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            buttonSave.leadingAnchor.constraint(equalTo: textField.leadingAnchor),

            buttonCancel.centerYAnchor.constraint(equalTo: buttonSave.centerYAnchor),
            buttonCancel.trailingAnchor.constraint(equalTo: textField.trailingAnchor)
        ])
    }

    @objc private func textDidChange() {
        textChanger?(textField.text ?? "")
        self.navigationController?.popToRootViewController(animated: true)
    }

    @objc private func dismissScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
