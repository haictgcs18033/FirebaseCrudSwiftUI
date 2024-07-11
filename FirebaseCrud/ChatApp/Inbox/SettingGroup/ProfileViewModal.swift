//
//  ProfileViewModal.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//


import SwiftUI
import PhotosUI
@MainActor
class ProfileViewModal : ObservableObject{
    @Published var selectedItem: PhotosPickerItem? {
        didSet { Task{ try await loadImage()} }
    }
    // thuc hien chuyen doi tu selectedItem khi nguoi dung chon bat ki mot tam anh nao trong may va gan gia tri vo profileImage
    @Published var profileImage: Image?
    func loadImage() async throws{
        //Tao bien de luu du lieu tu viec chon anh trong may
        guard let item = selectedItem else { return }
        //Chuyen doi du lieu thanh anh
        guard let imageData = try await item.loadTransferable(type: Data.self) else{ return }
        // Tao UI cho image
        guard let uiImage = UIImage(data: imageData) else{return}
        self.profileImage = Image(uiImage: uiImage)
        
        //Upload
        guard let imageUrl = try await ImageUploader().uploadImage(uiImage) else{return}
        try await UserService.shared.updateUserProfileImage(imageUrl)
    }
}
