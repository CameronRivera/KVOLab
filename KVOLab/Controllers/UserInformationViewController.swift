//
//  UserInformationViewController.swift
//  KVOLab
//
//  Created by Cameron Rivera on 4/6/20.
//  Copyright © 2020 Cameron Rivera. All rights reserved.
//

import UIKit

class UserInformationViewController: UIViewController {

    let userInformationView = UserInformationView()
    
    private var bankObserver: NSKeyValueObservation?
    
    override func loadView() {
        view = userInformationView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        configureBankObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    private func setUpTableView(){
        userInformationView.backgroundColor = UIColor.systemBackground
        userInformationView.tableView.dataSource = self
        userInformationView.tableView.delegate = self
        userInformationView.tableView.register(UserCell.self, forCellReuseIdentifier: "userCell")
        userInformationView.tableView.tableHeaderView = HeaderView()
        
        if Bank.shared.getNumberOfPatrons() == 0 {
            userInformationView.tableView.separatorStyle = .none
            userInformationView.tableView.backgroundView = EmptyStateView("No Users", "There are currently no users. Create a new user in the create user tab.")
        }
    }
    
    private func configureBankObserver(){
        bankObserver = Bank.shared.observe(\.patrons, options: [.old,.new], changeHandler: { [weak self] (bank, change) in
            self?.userInformationView.tableView.reloadData()
            self?.userInformationView.tableView.backgroundView = nil
            self?.userInformationView.tableView.separatorStyle = .singleLine
        })
    }
    
    deinit {
        bankObserver?.invalidate()
    }

}

extension UserInformationViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let xCell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("Could not dequeue reusable cell.")
        }
        xCell.configure(Bank.shared.getPatron(indexPath.row))
        return xCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Bank.shared.getNumberOfPatrons()
    }
}

extension UserInformationViewController: UITableViewDelegate{
    
}
