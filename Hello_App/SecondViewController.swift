//
//  SecondViewController.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 28/03/24.
//

import UIKit

class SecondViewController: UIViewController {
    var greeting = UILabel()
    var login: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(greeting)
        greeting.text = "Hello, \(login ?? "Sasha")!"
        
        greeting.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            greeting.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            greeting.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        // Do any additional setup after loading the view.
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
