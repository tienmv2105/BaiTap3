//
//  User.swift
//  BaiTapLogin
//
//  Created by Van Tien on 2/6/26.
//
import SwiftUI
import Observation
import Foundation

struct User: Identifiable, Hashable, Equatable {
    var id: String = UUID().uuidString
    var username: String
    var password: String
    var fullname: String
    var role: String
    let managerID: String?
}
