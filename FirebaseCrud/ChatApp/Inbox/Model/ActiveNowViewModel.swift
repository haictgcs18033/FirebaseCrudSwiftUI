//
//  ActiveNowViewModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/21.
//

import Foundation
import Firebase
class ActiveNowViewModel:ObservableObject{
    @Published var users = [User]()
    init(){
        Task{try await fetchUser()}
    }
    @MainActor
    private func fetchUser() async throws{
        //loc nguoi dung ra khoi danh sach nhung nguoi dung dang active hien tai
        guard let currentUid = Auth.auth().currentUser?.uid else{return}
        let users = try await UserService.fetchAllUser(limit:10)
        self.users = users.filter({ $0.id != currentUid })
    }
}
