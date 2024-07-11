//
//  ChatView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import SwiftUI

struct ChatView: View {
//    @State var user:User=User.MOCK_USER
//    @State var messanger = ""
    @StateObject var viewModel : ChatViewModel
    let user: User
    init(user:User){
        self.user = user
        self._viewModel=StateObject(wrappedValue: ChatViewModel(user: user))
    }
    var body: some View {
        VStack{
           
            ScrollView{
                VStack{
                    CircularProfileImageView(user: user, size: .xLarge)
                    Text(user.fullName)
                        .font(.title)
                        .fontWeight(.bold)
                        
                }
//                ForEach(0...5,id:\.self){message in
//                    ChatMessageCell(isFromCurrentUser: Bool.random())
//                }
                LazyVStack{
                    ForEach(viewModel.messages){message in
    //                    ChatMessageCell(isFromCurrentUser: Bool.random())
                        ChatMessageCell(message: message)
                    }
                }
            }
            ZStack(alignment: .trailing){
                Spacer()
                TextField("Message",text: $viewModel.messageText,axis: .vertical)
                    .padding(12)
                    .padding(.trailing,55)
                    .background(Color(.systemGroupedBackground))
                    .clipShape(Capsule())
                Button(action: {
                    viewModel.sendMessage()
                    viewModel.messageText = ""
                }, label: {
                    Text("Send")
                })
                
                .padding()
            }
            .padding()
            .navigationTitle(user.fullName)
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    ChatView(user:User.MOCK_USER)
}
