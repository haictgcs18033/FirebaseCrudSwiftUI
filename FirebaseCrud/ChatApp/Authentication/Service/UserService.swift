//
//  UserService.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/12.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class UserService{
    @Published var currentUser:User?
    static let shared = UserService()
    @MainActor
    func fetchCurrentUser()async throws{
        guard let uid=Auth.auth().currentUser?.uid else{return}
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
//        print("Debug: this user is ------ \(currentUser)")
        
    }
    @MainActor
    static func fetchAllUser(limit : Int? = nil) async throws -> [User]{
        let query = FirestoreConstants.UserCollection
        if let limit{
            query.limit(to: limit)
        }
        let snapshot = try await query.getDocuments()
        return snapshot.documents.compactMap({try? $0.data(as:User.self)})
      
    }
    static func fetchUser(withUid uid : String, completion: @escaping(User)->Void){
        //Su dung escaping de handle cac tac vu bat dong bo vi du nhu doan code duoi day Hello user se duoc in ra truoc tac vu cua Firebase vi
        //tac vu firebase se ton thoi gian
        FirestoreConstants.UserCollection.document(uid).getDocument {  snapshot, _ in
            guard let user = try? snapshot?.data(as: User.self) else{return}
            completion(user)
        }
        print("Hello User")
    }
    
    
    //Upload Image
    func updateUserProfileImage(_ imageUrl:String) async throws{
        guard let uid = Auth.auth().currentUser?.uid else{ return }
        try await FirestoreConstants.UserCollection.document(uid).updateData([
            "profileImageUrl" : imageUrl
        ])
    }
}
