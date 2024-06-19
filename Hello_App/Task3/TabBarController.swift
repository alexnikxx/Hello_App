//
//  TabBarController.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 11/04/24.
//

import UIKit

final class TabBarController: UITabBarController {
    private let greeting: Greeting

    init(greeting: Greeting) {
        self.greeting = greeting
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewTab1 = HelloViewController(greeting: greeting)
        let viewTab2 = EditHelloViewController(greeting: greeting)

        viewTab1.tabBarItem = UITabBarItem(title: "Hello", image: UIImage(systemName: "square.fill"), selectedImage: nil)
        viewTab2.tabBarItem = UITabBarItem(title: "Edit", image: UIImage(systemName: "square.fill"), selectedImage: nil)
        viewControllers = [viewTab1, viewTab2]
    }
}
