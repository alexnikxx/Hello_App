//
//  SecondViewController.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 28/03/24.
//

import UIKit

class SecondViewController: UIViewController {
    var login: String?

    var greeting: UILabel = {
        let label = UILabel()
        label.text = "Hello, Sasha!"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(greeting)
        greeting.text = "Hello, \(login ?? "Sasha")!"

        setupView()
    }
    
    private func setupView() {
        NSLayoutConstraint.activate([
            greeting.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greeting.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
