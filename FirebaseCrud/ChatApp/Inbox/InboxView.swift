//
//  InboxView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import SwiftUI


struct InboxView: View {
    @State private var showNewMessageView = false
    //   @State private var userMock = User.MOCK_USER
    @StateObject var viewModel = InboxViewModel()
    @StateObject var viewModelUsers = NewMessageViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    private var user:User?{
        return viewModel.currentUser
    }
    var body: some View {
        NavigationStack{
            //            ScrollView{
            //
            //                ActiveView(user:user)
            //                List{
            //                    ForEach(viewModel.recentMessages){message in
            //                        //Dat mot NavigationLink ben trong ZStack nhan vao mot EmptyView roi cho opacity(0.0) se tao ra mot duong dan vo hinh
            //                        //tu do co the ghi de layout len duong dan vo hinh do
            //                        ZStack{
            //                            NavigationLink(value : message){
            //                               EmptyView()
            //                            }.opacity(0.0)
            //                            InboxRowView(message:message)
            //
            //                        }
            //
            //
            //                    }
            //                }
            //                //Cau lenh hien thi list in scroll view
            //                .listStyle(PlainListStyle())
            //                .frame(height:UIScreen.main.bounds.height)
            //
            //            }
            List{
                ActiveView(user:user)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal,4)
                ForEach(viewModel.recentMessages){message in
                    //Dat mot NavigationLink ben trong ZStack nhan vao mot EmptyView roi cho opacity(0.0) se tao ra mot duong dan vo hinh
                    //tu do co the ghi de layout len duong dan vo hinh do
                    ZStack{
                        NavigationLink(value : message){
                            EmptyView()
                        }.opacity(0.0)
                        InboxRowView(viewModel: viewModel, message: message)
                        
                    }
                    
                    
                }
            }
            .navigationTitle("Chats")
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(PlainListStyle())
            //if got selectedUser so showChat will be always true
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
                
            })
            
            //            .navigationDestination(for: User.self, destination: { user in
            //                ProfileView(user: user)
            //            })
            .navigationDestination(for: Route.self, destination: { route in
                switch route{
                case.profile(let user):
                    ProfileView(user:user)
                case .chatView(let user):
                    ChatView(user: user)
                }
                
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser{
                    ChatView(user:user)
                }
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user{
                    ChatView(user:user)
                }
            })
            .fullScreenCover(isPresented: $showNewMessageView ){
                NewMessage(selectedUser:$selectedUser)
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    HStack{
                        if let user{
                            NavigationLink(value: Route.profile(user), label: {
                                CircularProfileImageView(user: user, size: .small)
                            })
                        }
                        //                        Text(user.fullName)
                        Text(user?.fullName ?? "")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button(action: {
                        showNewMessageView=true
                        selectedUser = nil
                    }, label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .foregroundStyle(.black,Color(.systemGray5))
                    })
                }
            }
        }
    }
}

#Preview {
    InboxView()
}
