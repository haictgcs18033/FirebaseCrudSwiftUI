//
//  LoginViewModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/10.
//

import Foundation
class LoginViewModel:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    func login() async throws{
        print("Alo")
        try await AuthService.shared.login(withEmail: email, password: password)
    }
}
