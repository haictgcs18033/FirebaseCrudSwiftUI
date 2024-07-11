//
//  ContentViewModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/11.
//

import Foundation

import Firebase
import Combine
//su dung userSession tu AuthService de xac dinh xem nguoi dung co dang nhap vao he thong hay khong

class ContentViewModel:ObservableObject{
    @Published var userSession:FirebaseAuth.User?
    private var cancelable = Set<AnyCancellable>()
    init(){
        setupSubcribers()
    }
    private func setupSubcribers(){
        AuthService.shared.$userSession.sink{[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService}
        .store(in: &cancelable)
    }
}
