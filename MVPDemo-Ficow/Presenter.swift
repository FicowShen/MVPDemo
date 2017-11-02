//
//  Presenter.swift
//  MVPDemo-Ficow
//
//  Created by ficow on 2017/11/2.
//  Copyright © 2017年 ficowshen. All rights reserved.
//

import Foundation

struct UserViewData{
    let name: String
    let age: String
}

protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(users: [UserViewData])
    func setEmptyUsers()
}

class UserPresenter {
    private let userModel:UserModel
    weak private var userView : UserView?
    
    init(userModel:UserModel){
        self.userModel = userModel
    }
    
    func attachView(view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    func getUsers(){
        self.userView?.startLoading()
        userModel.getUsers{ [weak self] users in
            self?.userView?.finishLoading()
            if(users.count == 0){
                self?.userView?.setEmptyUsers()
            }else{
                let mappedUsers = users.map{
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.userView?.setUsers(users: mappedUsers)
            }
            
        }
    }
}
