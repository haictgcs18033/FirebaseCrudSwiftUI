//
//  InboxService.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/21.
//

import Foundation
import Firebase
class InboxService{
    @Published var documentChanges = [DocumentChange]()
    func observeRecentMessage(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let query = FirestoreConstants
            .MessageCollection
            .document(uid)
            .collection("recent-messages")
            .order(by: "timestamp",descending: true)
        query.addSnapshotListener { snapshot, _ in
            guard let changes = snapshot?.documentChanges.filter({
                $0.type == .added || $0.type == .modified
            }) else{return}
            self.documentChanges = changes
        }
        
    }
    func deleteConversation(recentMessage: Message) async throws{
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let chatPartner = recentMessage.user else{return}
        let snapshot = try await
            FirestoreConstants
            .MessageCollection
            .document(uid)
            .collection(chatPartner.id)
            .getDocuments()
        for doc in snapshot.documents{
            try await
                FirestoreConstants
                .MessageCollection
                .document(uid)
                .collection(chatPartner.id)
                .document(doc.documentID)
                .delete()
        }
        try await
            FirestoreConstants
            .MessageCollection
            .document(uid)
            .collection("recent-messages")
            .document(recentMessage.id)
            .delete()
    }
}
