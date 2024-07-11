//
//  Constanst.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/21.
//

import Foundation
import Firebase
struct FirestoreConstants{
   static let UserCollection = Firestore.firestore().collection("users")
   static let MessageCollection = Firestore.firestore().collection("messages")
}
