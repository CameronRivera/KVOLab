//
//  UserViewController.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/6/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class CreateUserViewController: UIViewController {

    private let createUserView = CreateUserView()
    
    override func loadView(){
        view = createUserView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    private func setUp(){
        createUserView.backgroundColor = UIColor.systemBackground
        createUserView.userNameTextField.delegate = self
        createUserView.balanceTextField.delegate = self
        createUserView.submitButton.addTarget(self, action: #selector(createNewUserButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func createNewUserButtonPressed(_ sender: UIButton){
        guard let username = createUserView.userNameTextField.text, !username.isEmpty, let balance = createUserView.balanceTextField.text, let amount = Double(balance), !Bank.shared.patronExists(username) else {
            showAlert("Invalid Fields", "One or more fields are invalid. Could not create user.")
            return
        }
        let newUser = User(username, amount)
        Bank.shared.addPatron(newUser)
        createUserView.balanceTextField.text = ""
        createUserView.balanceTextField.resignFirstResponder()
        createUserView.userNameTextField.text = ""
        createUserView.userNameTextField.resignFirstResponder()
        showAlert("Added new user", nil)
    }
}

extension CreateUserViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
