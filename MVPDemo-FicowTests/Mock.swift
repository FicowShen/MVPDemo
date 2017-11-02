//
//  Mock.swift
//  MVPDemo-Ficow
//
//  Created by ficow on 2017/11/2.
//  Copyright © 2017年 ficowshen. All rights reserved.
//

import Foundation

@testable import MVPDemo_Ficow

class MockModel: UserModel {
    private let users: [User]
    init(users: [User]) {
        self.users = users
    }
    override func getUsers(finish: @escaping ([User]) -> Void) {
        finish(users)
    }
    
}

class MockView : NSObject, UserView{
    func startLoading() {
        print("\(#function)")
    }
    
    func finishLoading() {
        print("\(#function)")
    }
    
    var setUsersCalled = false
    var setEmptyUsersCalled = false
    
    func setUsers(users: [UserViewData]) {
        setUsersCalled = true
    }
    
    func setEmptyUsers() {
        setEmptyUsersCalled = true
    }
}
