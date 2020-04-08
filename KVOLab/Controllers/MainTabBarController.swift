//
//  MainTabBarController.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/6/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    public lazy var createUserVC: CreateUserViewController = {
        let vc = CreateUserViewController()
        vc.tabBarItem = UITabBarItem(title: "Create User", image: UIImage(systemName: "person.fill"), tag: 1)
        return vc
    }()
    
    public lazy var withdrawalVC: WithdrawalsViewController = {
       let vc = WithdrawalsViewController()
        vc.tabBarItem = UITabBarItem(title: "Deposit/Withdraw", image: UIImage(systemName: "dollarsign.square"), tag: 2)
        return vc
    }()
    
    public lazy var userInformationVC: UserInformationViewController = {
       let vc = UserInformationViewController()
        vc.tabBarItem = UITabBarItem(title: "User Info", image: UIImage(systemName: "moon.stars"), tag: 3)
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [createUserVC,withdrawalVC,userInformationVC]
    }
}
