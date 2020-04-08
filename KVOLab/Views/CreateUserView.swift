//
//  CreateUserView.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/6/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class CreateUserView: UIView {
    
    public lazy var directionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Create New User"
        label.textColor = UIColor.black
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        return label
    }()
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "UserName:"
        return label
    }()
    
    public lazy var userNameTextField: UITextField = {
       let textField = UITextField()
        textField.placeholder = " Enter username here"
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    public lazy var startingBalanceLabel: UILabel = {
        let label = UILabel()
        label.text = "Starting Balance:"
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var balanceTextField: UITextField = {
       let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 1
        textField.placeholder = " Enter starting balance here"
        return textField
    }()
    
    public lazy var submitButton: UIButton = {
       let button = UIButton()
        button.setTitle("Create", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        setUpDirectionsLabelConstraints()
        setUpUserNameLabelConstraints()
        setUpUserNameTextFieldConstraints()
        setUpStartingBalanceLabelConstraints()
        setUpStartingBalanceTextFieldConstraints()
        setUpSubmitButtonConstraints()
    }

    private func setUpDirectionsLabelConstraints(){
        addSubview(directionsLabel)
        directionsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([directionsLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), directionsLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func setUpUserNameLabelConstraints(){
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([userNameLabel.topAnchor.constraint(equalTo: directionsLabel.bottomAnchor, constant: 50), userNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), userNameLabel.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    private func setUpUserNameTextFieldConstraints(){
        addSubview(userNameTextField)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([userNameTextField.topAnchor.constraint(equalTo: directionsLabel.bottomAnchor, constant: 50), userNameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), userNameTextField.heightAnchor.constraint(equalToConstant: 40), userNameTextField.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor, constant: 53)])
        userNameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    private func setUpStartingBalanceLabelConstraints(){
        addSubview(startingBalanceLabel)
        startingBalanceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([startingBalanceLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 20), startingBalanceLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), startingBalanceLabel.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    private func setUpStartingBalanceTextFieldConstraints(){
        addSubview(balanceTextField)
        balanceTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([balanceTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20), balanceTextField.leadingAnchor.constraint(equalTo: startingBalanceLabel.trailingAnchor, constant: 8), balanceTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), balanceTextField.heightAnchor.constraint(equalToConstant: 40)])
        startingBalanceLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    private func setUpSubmitButtonConstraints(){
        addSubview(submitButton)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([submitButton.topAnchor.constraint(equalTo: balanceTextField.bottomAnchor, constant: 50), submitButton.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
}
