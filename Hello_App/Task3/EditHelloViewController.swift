//
//  TaskThreeViewController3.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 11/04/24.
//

import UIKit

final class EditHelloViewController: UIViewController, UITextFieldDelegate {
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
        label.text = "Измените заголовок:"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let textField: UITextField = {
        let text = UITextField()
        text.placeholder = "Введите заголовок"
        text.text = "Привет"
        text.borderStyle = .roundedRect
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func viewDidLoad() {
        view.backgroundColor = .white

        textField.delegate = self

        view.addSubview(label)
        view.addSubview(textField)
        setupView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.hidesBackButton = true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateHello(self.textField.text ?? "Hello")
        textField.resignFirstResponder()
        return true
    }

    private func updateHello(_ hello: String) {
        greeting.hello = hello
    }

    private func setupView() {
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            textField.widthAnchor.constraint(equalToConstant: 300),

            label.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            label.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10)
        ])
    }
}
