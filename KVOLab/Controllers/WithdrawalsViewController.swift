//
//  WithdrawalsViewController.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/6/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class WithdrawalsViewController: UIViewController {

    private let withdrawView = WithdrawalsView()
    
    override func loadView() {
        view = withdrawView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        hideTransactionUI()
    }
    
    private func setUp(){
        view.backgroundColor = UIColor.systemBackground
        withdrawView.userNameTextField.delegate = self
        withdrawView.amountSlider.addTarget(self, action: #selector(amountSliderChanged), for: .valueChanged)
        withdrawView.withdrawButton.addTarget(self, action: #selector(withdrawButtonPressed), for: .touchUpInside)
        withdrawView.depositButton.addTarget(self, action: #selector(depositButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func amountSliderChanged(_ sender: UISlider){
        withdrawView.amountLabel.text = "$ \(String(format: "%.2f", sender.value))"
    }
    
    private func showTransactionUI(){
        withdrawView.withdrawButton.alpha = 1.0
        withdrawView.depositButton.alpha = 1.0
        withdrawView.buttonStackView.alpha = 1.0
        withdrawView.amountSlider.alpha = 1.0
        withdrawView.amountLabel.alpha = 1.0
        withdrawView.directionsLabel.text = "Select an amount"
    }
    
    private func hideTransactionUI(){
        withdrawView.withdrawButton.alpha = 0.0
        withdrawView.depositButton.alpha = 0.0
        withdrawView.buttonStackView.alpha = 0.0
        withdrawView.amountSlider.alpha = 0.0
        withdrawView.amountLabel.alpha = 0.0
        withdrawView.amountSlider.setValue(0.0, animated: false)
        withdrawView.directionsLabel.text = "Enter an existing user"
        withdrawView.userNameTextField.text = ""
    }
    
    @objc
    private func withdrawButtonPressed(_ sender: UIButton){
        guard let currentUser = withdrawView.userNameTextField.text else {
            return
        }
        Bank.shared.changeBalance(currentUser, Double(withdrawView.amountSlider.value), Transaction.withdraw)
        showAlert("Transaction Succeeded", "Successfully withdrew $\(String(format: "%.2f", withdrawView.amountSlider.value)) from \(currentUser)'s account.")
    }
    
    @objc
    private func depositButtonPressed(_ sender: UIButton){
        guard let currentUser = withdrawView.userNameTextField.text else {
            return
        }
        Bank.shared.changeBalance(currentUser, Double(withdrawView.amountSlider.value), Transaction.deposit)
        showAlert("Transaction Succeeded", "Successfully deposited $\(String(format: "%.2f", withdrawView.amountSlider.value)) into \(currentUser)'s account.")
    }
    
}

extension WithdrawalsViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let textFieldText = textField.text, !textFieldText.isEmpty, Bank.shared.patronExists(textFieldText) else {
            showAlert("User does not Exist", nil)
            return false
        }
        
        textField.resignFirstResponder()
        showTransactionUI()
        return true
    }
}
