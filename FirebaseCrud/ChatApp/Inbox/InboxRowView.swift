//
//  InboxRowView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import SwiftUI

struct InboxRowView: View {
//    @State var user = User.MOCK_USER
//    var user:User?
    @ObservedObject var viewModel : InboxViewModel
    var message: Message

    var body: some View {
        HStack(alignment:.top,spacing: 12){
//            CircularProfileImageView(user: user, size: .xLarge)
            CircularProfileImageView(user: message.user, size: .medium)
            VStack(alignment:.leading){
                Text(message.user?.fullName ?? "")
                    .fontWeight(.bold)
                    .font(.headline)
                Text(message.messageText)
                    .lineLimit(1)
                    .foregroundColor(.gray)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100,alignment: .leading)
            }
            .padding(.top,10)
            Spacer()
            HStack{
                Text(message.timestampString)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.right")
            }
            .font(.footnote)
            .foregroundColor(.gray)
            .padding(.top,10)
            
        }
        .frame(height: 72)
        .swipeActions{
            Button{
                onDelete()
            } label: {
                Image(systemName: "trash")
            }
            .tint(Color(.systemRed))
        }
    }
}
private extension InboxRowView{
    func onDelete(){
        Task{
            await viewModel.deleteRecentMessage(message)
        }
    }
}

//#Preview {
//    InboxRowView(message: Message)
//}
