//
//  ChatService.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/21.
//

import Foundation
import Firebase
struct ChatService{
    //    static let messagesCollection = Firestore.firestore().collection("messages")
    let chatPartner:User
    // ham gui message bao gom 2 tham so do la tin nhan va id cua nguoi ma minh muon gui
    func sendMessage(_ messageText: String){
        guard let currentUid = Auth.auth().currentUser?.uid else{return}
        let chatPartnerId = chatPartner.id
        
        let currentUserRef = FirestoreConstants.MessageCollection.document(currentUid).collection(chatPartnerId).document()
        let chatPartnerRef = FirestoreConstants.MessageCollection.document(chatPartnerId).collection(currentUid)
        
        //Recent User
        let recentCurrentUserRef = FirestoreConstants.MessageCollection.document(currentUid).collection("recent-messages").document(chatPartnerId)
        let recentPartnerRef = FirestoreConstants.MessageCollection.document(chatPartnerId).collection("recent-messages").document(currentUid)
        let messageId = currentUserRef.documentID
        
        let message = Message(
            messageId: messageId,
            fromId: currentUid,
            toId: chatPartnerId,
            messageText: messageText,
            timestamp: Timestamp()
        )
        guard let messageData = try? Firestore.Encoder().encode(message) else{return}
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
        recentCurrentUserRef.setData(messageData)
        recentPartnerRef.setData(messageData)
    }
    func observeMessage(completion: @escaping([Message]) -> Void){
        guard let currentUid = Auth.auth().currentUser?.uid else {return}
        let chatPartnerId = chatPartner.id
        let query = FirestoreConstants.MessageCollection
            .document(currentUid)
            .collection(chatPartnerId)
            .order(by: "timestamp",descending: false)
        query.addSnapshotListener{snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({$0.type == .added}) else{return}
            //decode incoming data(khi nguoi dung gui tin nhan mot tin nhan moi se duoc dua vaof collection tren firebase roi firebase se dua tat ca thong tin lien quan den tin nhan ve app bang viec decode)
            var messages = changes.compactMap({try? $0.document.data(as: Message.self)})
            for (index,message) in messages.enumerated() where message.isFromCurrentUser {
                messages[index].user = chatPartner
            }
            completion(messages)
        }
    }
}
