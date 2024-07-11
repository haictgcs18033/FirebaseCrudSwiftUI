//
//  UserModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import Foundation

import FirebaseFirestoreSwift

struct User: Codable, Identifiable,Hashable{
    //Moi khi the du lieu vao firestore trong firebase firebase se tao mot uid cho chung ta chung ta co the dung @DocumentID de truy cap vao id do
    @DocumentID var uid:String?
    
    var id:String {
        return uid ?? NSUUID().uuidString
    }
    let fullName:String
    let email:String
    var profileImageUrl:String?
    
    var firstName:String {
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullName)
        return components?.givenName ?? fullName
    }
}
extension User{
    static let MOCK_USER = User(fullName: "John", email: "john@gmail.com",profileImageUrl: "post4")

}
