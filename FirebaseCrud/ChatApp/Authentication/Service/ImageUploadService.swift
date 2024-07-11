//
//  ImageUploadService.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/27.
//


import FirebaseStorage
import UIKit
//Firebase Storage duoc su dung de luu nhung du lieu kich co lon nhu  hinh , audio ,etc. Khac voi relational database
// Firestore dung de luu du lieu kich thuoc nho nhu du lieu nguoi dung 
struct ImageUploader{
    func uploadImage(_ image: UIImage) async throws -> String? {
      
        // lay du lieu anh
        guard let imageData = image.jpegData(compressionQuality: 0.1) else {
            return nil
        }
     
        let fileName = NSUUID().uuidString
        
        //tham chieu den firebase storage
        let ref = Storage.storage().reference(withPath: "/profile_images/\(fileName)")
        //dua hinh len firebase storage
        let _ = try await ref.putDataAsync(imageData)
        //lay url tu anh dc luu trong firestore
        let url = try await ref.downloadURL()
       
      
       
        return url.absoluteString
      
    }
}

