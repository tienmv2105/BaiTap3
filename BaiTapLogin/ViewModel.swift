//
//  ViewModel.swift
//  BaiTapLogin
//
//  Created by Van Tien on 2/6/26.
//
import Foundation
import Observation
import SwiftUI

@Observable
class ViewModel {
    var users: [User] = [
        User(username: "Boss 1", password: "123", fullname: "Nguyen Van A", role: "Supervisor", managerID: ""),
        User(username: "User 2", password: "123", fullname: "Nguyen Van B", role: "Supervisor", managerID: "Boss 1"),
        User(username: "User 3", password: "123", fullname: "Nguyen Van C", role: "Supervisor", managerID: "Boss 1")
    ]
    
    func createUser(userName: String,
                    password: String,
                    fullName: String,
                    role: String,
                    managerID: String) {
        let newUser = User(username: userName, password: password, fullname: fullName, role: role, managerID: managerID)
        users.append(newUser)
    }
    
    func listUserByManagerID(tenCuaSep: String) -> [User] {
        return  users.filter { $0.managerID == tenCuaSep }
    }
    
    func editUser(idUser: String, newName: String, newRole: String) {
        if let index = users.firstIndex(where: { $0.id == idUser }) {
            users[index].fullname = newName
            users[index].role = newRole
        }
    }
    
    func usernameExist(userName: String) -> Bool {
        let isUsernameExist = users.contains(where: { $0.username == userName })
        return isUsernameExist
    }
    
    
    func checkLogin(userName: String, password: String) -> User? {
        let loginSuccess = users.first(where:  { $0.username.lowercased() == userName.lowercased() && $0.password == password })
        return loginSuccess
    }
    
    func deleteUser(index: IndexSet){
        users.remove(atOffsets: index)
    }
}
