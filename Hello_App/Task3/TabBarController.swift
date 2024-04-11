//
//  TabBarController.swift
//  Hello_App
//
//  Created by Aleksandra Nikiforova on 11/04/24.
//

import UIKit

final class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let viewTab1 = TaskThreeViewController2()
        let viewTab2 = TaskThreeViewController3(delegate: TaskThreeViewController2())

        viewTab1.tabBarItem = UITabBarItem(title: "Hello", image: UIImage(systemName: "square.fill"), selectedImage: nil)
        viewTab2.tabBarItem = UITabBarItem(title: "Edit", image: UIImage(systemName: "square.fill"), selectedImage: nil)
        viewControllers = [viewTab1, viewTab2]
    }
}
