//
//  User.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

@objc class User: NSObject{
    private let name: String
    @objc dynamic private var currentBalance: Account
    
    init(_ name: String, _ startingBalance: Double){
        self.name = name
        currentBalance = Account(startingBalance)
    }
    
    public func getUserName() -> String {
        return self.name
    }
    
    public func getCurrentBalance() -> Account {
        return self.currentBalance
    }
}
