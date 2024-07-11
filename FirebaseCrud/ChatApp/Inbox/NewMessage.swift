//
//  NewMessage.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import SwiftUI

struct NewMessage: View {
    @State var searchText = ""
    @StateObject private var viewModel = NewMessageViewModel()
    @Environment(\.dismiss) var dismiss
    @Binding var selectedUser:User?
    var body: some View {
        NavigationStack{
            ScrollView{
                TextField("To : ",text: $searchText)
                    .frame(height:44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                Text("CONTACT")
                    .frame(maxWidth:.infinity,alignment: .leading)
                    .foregroundColor(.gray)
                    .padding()
                List{

                    ForEach(viewModel.users){user in
                        VStack{
                            HStack{
                                CircularProfileImageView(user: user, size: .small)
                                Text(user.fullName)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            .padding(.leading)
//                            Divider()
//                                .padding(.leading,40)
                        }
                        .onTapGesture {
                            selectedUser = user
                            dismiss()
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .frame(height:UIScreen.main.bounds.height)
                
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement:.topBarLeading){
                    Button("Cancel"){
                       dismiss()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    
    }
}

#Preview {
    NewMessage(selectedUser: .constant(User.MOCK_USER))
}
