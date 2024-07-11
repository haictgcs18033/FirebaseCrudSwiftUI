//
//  RegisterViewModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/10.
//

import Foundation

class RegisterViewModel:ObservableObject{
    @Published var email :String = ""
    @Published var password:String = ""
    @Published var name:String = ""
    func createUser()async throws{
        try await AuthService.shared.register(withEmail: email, password:password,name: name)
    }
}
