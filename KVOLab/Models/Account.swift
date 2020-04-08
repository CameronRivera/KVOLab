//
//  Account.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

@objc class Account: NSObject{
    
    @objc dynamic private var balance: Double
    
    init(_ balance: Double){
        self.balance = balance
    }
    
    public func deposit(_ amount: Double){
        balance += amount
    }
    
    public func withdraw(_ amount: Double){
        let tempBalance = balance - amount
        if tempBalance < 0.0 {
            balance = 0.0
        } else {
            balance -= amount
        }
    }
    
    public func getBalance() -> Double {
        return balance
    }
}
