//
//  UserCell.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/7/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(_ user: User){
        self.textLabel?.text = user.getUserName()
        self.detailTextLabel?.text = "$\(String(format: "%.2f", user.getCurrentBalance().getBalance()))"
    }
}
