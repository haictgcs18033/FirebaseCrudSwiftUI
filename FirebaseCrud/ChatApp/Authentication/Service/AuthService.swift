//
//  AuthService.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/10.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
class AuthService{
    // keep track of whether the user is login or not
    @Published var userSession:FirebaseAuth.User?
    static let shared = AuthService()
    init(){
        //functionality that we get from the firebase when the user logged in and store this locally in our application
        self.userSession = Auth.auth().currentUser
        loadCurrentUser()
        print("Debug: user session id is  =======\(userSession?.uid)")
    }
    //Nhung function duoc ghi o day deu chay trong background thread nen swift ui khong xac dinh duoc luong du lieu duoc
    //cap nhat trong background thread nen ta can thong bao cho swift ui biet nhung thay doi trong background thread bang
    // cach su dung @MainActor
    @MainActor
    func login(withEmail email:String,password:String) async throws{
        
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            loadCurrentUser()
        }catch{
            print("Fail to login")
        }
    }
    @MainActor
    func register(withEmail email:String,password:String,name:String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password:password)
            self.userSession = result.user
            try await self.uploadUserData(email: email, fullname: name, id: result.user.uid)
            loadCurrentUser()
            print("create user : \(result.user.uid)")
        }catch{
            print("Error ---------\(error.localizedDescription)")
        }
    }
    func logout(){
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            UserService.shared.currentUser = nil;
        }catch{
            print("\(error.localizedDescription)")
        }
    }
    private func uploadUserData(email:String,fullname:String,id:String) async throws{
        let user = User(fullName: fullname, email: email,profileImageUrl: nil)
        guard let encodedUser = try? Firestore.Encoder().encode(user) else{return}
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    private func loadCurrentUser(){
        Task{
            try await UserService.shared.fetchCurrentUser()
        }
    }
}
