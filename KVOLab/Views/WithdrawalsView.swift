//
//  WithdrawalsView.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/6/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class WithdrawalsView: UIView {
    
    public lazy var withdrawLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.textColor = UIColor.black
        label.text = "Deposit/Withdraw"
        return label
    }()
    
    public lazy var userNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.text = "UserName:"
        return label
    }()
    
    public lazy var userNameTextField: UITextField = {
       let tf = UITextField()
        tf.placeholder = " Enter user name here"
        tf.layer.cornerRadius = 10
        tf.layer.borderColor = UIColor.black.cgColor
        tf.layer.borderWidth = 1.0
        return tf
    }()
    
    public lazy var directionsLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Enter the name of a valid user"
        label.alpha = 1.0
        return label
    }()
    
    public lazy var amountLabel: UILabel = {
       let label = UILabel()
        label.textColor = UIColor.black
        label.text = "$0"
        label.alpha = 0.0
        return label
    }()
    
    public lazy var amountSlider: UISlider = {
        let slider = UISlider()
        slider.maximumValue = 1000
        slider.maximumValueImage = UIImage(systemName: "plus")
        slider.minimumValue = 0
        slider.minimumValueImage = UIImage(systemName: "minus")
        slider.value = 0
        slider.alpha = 0.0
        return slider
    }()
    
    public lazy var withdrawButton: UIButton = {
       let button = UIButton()
        button.setTitle("Withdraw", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.alpha = 0.0
        return button
    }()
    
    public lazy var depositButton: UIButton = {
       let button = UIButton()
        button.setTitleColor(UIColor.blue, for: .normal)
        button.setTitle("Deposit", for: .normal)
        button.alpha = 0.0
        return button
    }()
    
    public lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alpha = 0.0
        return stackView
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
        setUpWithdrawLabelConstraints()
        setUpUserNameLabelConstraints()
        setUpUserNameTextFieldConstraints()
        setUpDirectionsLabelConstraints()
        setUpAmountLabelConstraints()
        setUpAmountSliderConstraints()
        setUpButtonStackViewConstraints()
    }
    
    private func setUpWithdrawLabelConstraints(){
        addSubview(withdrawLabel)
        withdrawLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([withdrawLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20), withdrawLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func setUpUserNameLabelConstraints(){
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([userNameLabel.topAnchor.constraint(equalTo: withdrawLabel.bottomAnchor, constant: 50), userNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), userNameLabel.heightAnchor.constraint(equalToConstant: 40)])
    }
    
    private func setUpUserNameTextFieldConstraints(){
        addSubview(userNameTextField)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([userNameTextField.topAnchor.constraint(equalTo: withdrawLabel.bottomAnchor, constant: 50), userNameTextField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8), userNameTextField.leadingAnchor.constraint(equalTo: userNameLabel.trailingAnchor, constant: 8), userNameTextField.heightAnchor.constraint(equalToConstant: 40)])
        
        userNameLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }
    
    private func setUpDirectionsLabelConstraints() {
        addSubview(directionsLabel)
        directionsLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([directionsLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 50),  directionsLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func setUpAmountLabelConstraints() {
        addSubview(amountLabel)
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([amountLabel.topAnchor.constraint(equalTo: directionsLabel.bottomAnchor, constant: 50), amountLabel.centerXAnchor.constraint(equalTo: centerXAnchor)])
    }
    
    private func setUpAmountSliderConstraints() {
        addSubview(amountSlider)
        amountSlider.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([amountSlider.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 20), amountSlider.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16), amountSlider.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16)])
    }
    
    private func setUpButtonStackViewConstraints() {
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(withdrawButton)
        buttonStackView.addArrangedSubview(depositButton)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([buttonStackView.topAnchor.constraint(equalTo: amountSlider.bottomAnchor, constant: 20), buttonStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8), buttonStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8)])
    }


}
