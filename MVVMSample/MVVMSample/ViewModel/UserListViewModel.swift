//
//  UserListViewModel.swift
//  MVVMSample
//
//  Created by Singh, Dev on 2020/04/03.
//  Copyright © 2020 Singh, Dev. All rights reserved.
//

import Foundation

struct UserListViewModel {
    let users: [User]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return users.count
    }
    
    func userAtIndex(_ index: Int) -> UserViewModel {
        let user = self.users[index]
        return UserViewModel(user)
    }
}


struct UserViewModel {
    private let user: User
}

extension UserViewModel {
    init(_ user: User) {
        self.user = user
    }
}

extension UserViewModel {
    
    var name: String {
        return self.user.name
    }
    
    var email: String {
        return self.user.email
    }
}
