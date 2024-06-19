//
//  TaskTwoViewController2.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 05/04/24.
//

import UIKit

final class TaskTwoViewController2: UIViewController {
    private var delegate: TaskTwoViewController2Delegate?
    
    init(delegate: TaskTwoViewController2Delegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            
            buttonSave.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            buttonSave.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            
            buttonCancel.centerYAnchor.constraint(equalTo: buttonSave.centerYAnchor),
            buttonCancel.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            buttonCancel.leadingAnchor.constraint(greaterThanOrEqualTo: buttonSave.trailingAnchor, constant: 20)
        ])
    }
    
    @objc private func textDidChange() {
        delegate?.delegate(greeting: textField.text ?? "Привет!")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @objc private func dismissScreen() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
