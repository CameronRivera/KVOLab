//
//  HeaderView.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/6/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class HeaderView: UIView {

    public lazy var label: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.text = "List of Users"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 80))
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpLabelConstraints()
    }
    
    private func setUpLabelConstraints(){
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor), label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor), label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor), label.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)])
    }

}
