//
//  Model.swift
//  MVPDemo-Ficow
//
//  Created by ficow on 2017/11/2.
//  Copyright © 2017年 ficowshen. All rights reserved.
//

import Foundation

struct User {
    let firstName: String
    let lastName: String
    let email: String
    let age: Int
}

class UserModel {
    
    func getUsers(finish:@escaping (([User]) -> Void)){
        
        let users = [User(firstName: "Iyad", lastName: "Agha", email: "iyad@test.com", age: 36),
                     User(firstName: "Mila", lastName: "Haward", email: "mila@test.com", age: 24),
                     User(firstName: "Mark", lastName: "Astun", email: "mark@test.com", age: 39)]
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            finish(users)
        }
    }
}
