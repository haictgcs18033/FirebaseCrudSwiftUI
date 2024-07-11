//
//  User.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/06.
//

import Foundation
import SwiftData
@Model
final class UserClass:Identifiable{
    var name : String
    var age : String
    init(name: String, age: String) {
        self.name = name
        self.age = age
    }
}
