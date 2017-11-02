//
//  ViewController.swift
//  MVPDemo-Ficow
//
//  Created by ficow on 2017/11/2.
//  Copyright © 2017年 ficowshen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTV: UITableView!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var emptyView: UILabel!
    
    private let userPresenter = UserPresenter(userModel: UserModel())
    private var usersData = [UserViewData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainTV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        userPresenter.attachView(view: self)
        userPresenter.getUsers()
    }
}

extension ViewController: UserView {
    
    func startLoading() {
        indicator?.startAnimating()
    }
    
    func finishLoading() {
        indicator?.stopAnimating()
    }
    
    func setUsers(users: [UserViewData]) {
        usersData = users
        mainTV?.isHidden = false
        emptyView?.isHidden = true;
        mainTV?.reloadData()
    }
    
    func setEmptyUsers() {
        mainTV?.isHidden = true
        emptyView?.isHidden = false;
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
            let userViewData = usersData[indexPath.row]
            cell.textLabel?.text = userViewData.name
            cell.detailTextLabel?.text = userViewData.age
        
            return cell
        }
}
