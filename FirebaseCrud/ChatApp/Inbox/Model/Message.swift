//
//  Message.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/13.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
struct Message:Identifiable,Codable,Hashable{
    @DocumentID var messageId: String?
    let fromId: String
    let toId: String
    let messageText: String
    let timestamp: Timestamp
    var user:User?
    
    var id:String {
        return messageId ?? NSUUID().uuidString
    }
    
    var chatPartnerId: String{
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool{
        return fromId == Auth.auth().currentUser?.uid
    }
    var timestampString:String{
        return timestamp.dateValue().timestampString()
    }
    
}
