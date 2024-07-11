//
//  ChatMessageCell.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import SwiftUI

struct ChatMessageCell: View {
//    let isFromCurrentUser:Bool
    let message:Message
    private var isFromCurrentUser:Bool{
        return message.isFromCurrentUser
    }
    @State var user:User = User.MOCK_USER
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer()
                Text(message.messageText)
                    .font(.subheadline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(ChatBurble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth:UIScreen.main.bounds.width/1.5,alignment: .trailing)
            }else{
                HStack(alignment:.bottom, spacing:8){
                    CircularProfileImageView(user: message.user, size: .small)
                    Text(message.messageText)
                        .font(.subheadline)
                        .padding()
                        .background(Color(.systemGray4))
                        .foregroundColor(.black)
                        .clipShape(ChatBurble(isFromCurrentUser: false))
                        .frame(maxWidth:UIScreen.main.bounds.width/1.5,alignment: .leading)
                    Spacer()
                }
              
              
            }
        }
        .padding(.horizontal,8)
    }
}

//#Preview {
//    ChatMessageCell(isFromCurrentUser: false)
//}
