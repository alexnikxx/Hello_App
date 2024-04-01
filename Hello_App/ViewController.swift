//
//  ViewController.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 28/03/24.
//

import UIKit

class ViewController: UIViewController {

    let textLogin = UILabel()
    let textPassword = UILabel()
    let login = UITextField()
    let password = UITextField()
    let button = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(textLogin)
        view.addSubview(login)
        view.addSubview(textPassword)
        view.addSubview(password)
        view.addSubview(button)
        
        textLogin.text = "Login"
        textPassword.text = "Password"
        button.setTitle("Open", for: .normal)
        button.addTarget(self, action: #selector(showSecondViewController), for: .touchUpInside)
        
        login.placeholder = "Fill your login"
        password.placeholder = "Fill your password"
        login.borderStyle = .roundedRect        
        password.borderStyle = .roundedRect
        login.autocapitalizationType = .none
        password.autocapitalizationType = .none
        
        textLogin.translatesAutoresizingMaskIntoConstraints = false
        login.translatesAutoresizingMaskIntoConstraints = false
        textPassword.translatesAutoresizingMaskIntoConstraints = false
        password.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            login.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            login.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            login.widthAnchor.constraint(equalToConstant: 300),
            
            textLogin.leadingAnchor.constraint(equalTo: login.leadingAnchor),
            textLogin.bottomAnchor.constraint(equalTo: login.topAnchor, constant: -10),
            
            password.leadingAnchor.constraint(equalTo: login.leadingAnchor),
            password.topAnchor.constraint(equalTo: login.bottomAnchor, constant: 60),
            password.widthAnchor.constraint(equalToConstant: 300),

            textPassword.leadingAnchor.constraint(equalTo: password.leadingAnchor),
            textPassword.bottomAnchor.constraint(equalTo: password.topAnchor, constant: -10),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
        ])
    }

    @objc func showSecondViewController(_ sender: Any) {
        let secondViewController = SecondViewController()
        secondViewController.login = login.text
        print(secondViewController.login)
        
        if password.text == "admin" {
            present(secondViewController, animated: true, completion: nil)
        }
    }
}

