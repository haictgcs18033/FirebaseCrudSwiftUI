//
//  InboxViewModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/13.
//

import Foundation
import Combine
import Firebase
//Su dung combine de pass du lieu tu cac class trong swiftui or tu mot service to view model type 
@MainActor
class InboxViewModel:Identifiable,ObservableObject{
    @Published var currentUser:User?
    @Published var recentMessages = [Message]()
    private var cancellables = Set<AnyCancellable>()
    private let service = InboxService()
    private var didCompleteInitialLoad = false
//    private var messageDict = [String: Message]()
    init(){
        setupSubcribers()
        service.observeRecentMessage()
    }
    
    private func setupSubcribers(){
        UserService.shared.$currentUser.sink{ [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        service.$documentChanges.sink{[weak self] changes in
//            self?.loadInitialMessages(fromChanges: changes)
            guard let self else{return}
            if didCompleteInitialLoad{
                updateMessages(changes)
            } else{
                loadInitialMessages(fromChanges: changes)
            }
        }.store(in: &cancellables)
    }
    private func loadInitialMessages(fromChanges changes: [DocumentChange]){
        var messages = changes.compactMap({ try? $0.document.data(as: Message.self) })
        for i in 0 ..< messages.count{
            let message = messages[i]
            UserService.fetchUser(withUid: message.chatPartnerId) { user in
                messages[i].user = user
                self.recentMessages.append(messages[i])
                // khi chay toi phan tu cuoi cung thi se thiet lap initial load = true
                if i == messages.count - 1{
                    self.didCompleteInitialLoad = true
                }
//                messageDict[user.id] = message
//                recentMessages = messageDict.map({$0.value})
            }
        }
    }
    
    //Fix bug recent message
    private func updateMessages(_ changes:[DocumentChange]){
        for change in changes{
            if change.type == .added{
               createNewConversation(change)
            }else if change.type == .modified{
                updateMessagesFromExistingConversation(change)
            }
        }
    }
    private func createNewConversation(_ change: DocumentChange){
        guard var message = try? change.document.data(as:Message.self) else {return}
        UserService.fetchUser(withUid: message.chatPartnerId){[weak self] user in
            message.user = user
            self?.recentMessages.insert(message, at: 0)
            
        }
                
    }
    private func updateMessagesFromExistingConversation(_ change: DocumentChange){
        guard var message = try? change.document.data(as: Message.self) else{return} // from message sending user
        //duyet qua mang neu tim duoc user id trung voi chatPartnerId tu phan tu cua mang recentMessages se tra ve index
        guard let index = self.recentMessages.firstIndex(where: { $0.user?.id == message.chatPartnerId}) else {return}
        //Lay ra th user tu recent message
        message.user = recentMessages[index].user
        recentMessages.remove(at: index)
        recentMessages.insert(message, at: 0)
        
    }
    func deleteRecentMessage(_ message:Message) async{
        do{
            guard let index = self.recentMessages.firstIndex(where: { $0.id == message.id}) else {return}
            recentMessages.remove(at: index)
            try await service.deleteConversation( recentMessage: message)
        } catch{
            print("DEBUG====Fail to delete message with \(error)")
        }
      
    }
    
}
