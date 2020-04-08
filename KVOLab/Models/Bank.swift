//
//  Bank.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import Foundation

enum Transaction {
    case withdraw
    case deposit
}

@objc class Bank: NSObject {
    static let shared = Bank()
    @objc dynamic public var patrons: [User]
    
    override private init(){
        patrons = []
    }
    
    public func addPatron(_ customer: User){
        patrons.append(customer)
    }
    
    public func getNumberOfPatrons() -> Int {
        return patrons.count
    }
    
    public func getPatron(_ index: Int) -> User {
        return patrons[index]
    }
    
    public func patronExists(_ username: String) -> Bool {
        guard !patrons.isEmpty else { return false }
        let targetPatron = patrons.filter{ $0.getUserName().lowercased() == username.lowercased() }
        return !targetPatron.isEmpty
    }
    
    private func findPatron(_ username: String) -> Int?{
        guard !patrons.isEmpty else { return nil }
        return patrons.firstIndex{ $0.getUserName().lowercased() == username.lowercased() }
    }
    
    public func changeBalance(_ username: String, _ amount: Double, _ action: Transaction){
        
        guard let targetPatronIndex = findPatron(username) else { return }
        
        if action == .deposit{
            
            let tempUser = User(username, patrons[targetPatronIndex].getCurrentBalance().getBalance() + amount)
            patrons[targetPatronIndex] = tempUser
            
        } else if action == .withdraw {
            
            var newBalance = patrons[targetPatronIndex].getCurrentBalance().getBalance() - amount
            
            if newBalance < 0.0 {
                newBalance = 0.0
            }

            let tempUser = User(username, newBalance)
            patrons[targetPatronIndex] = tempUser
            
        }
    }
}
