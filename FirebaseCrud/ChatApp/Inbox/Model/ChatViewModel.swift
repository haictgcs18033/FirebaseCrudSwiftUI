//
//  ChatViewModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/18.
//

import Foundation
class ChatViewModel:ObservableObject{
    @Published var messageText = ""
    @Published var messages = [Message]()
   
    let service:ChatService
    init(user:User){
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    func sendMessage(){
//        MessageService.sendMessage(messageText,toUser: user)
        service.sendMessage(messageText)
    }
    func observeMessages(){
        service.observeMessage(){ messages in
            self.messages.append(contentsOf: messages)
        }
    }
}
