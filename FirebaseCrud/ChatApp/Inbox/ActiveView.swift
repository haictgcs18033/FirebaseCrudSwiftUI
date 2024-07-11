//
//  ActiveView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import SwiftUI

struct ActiveView: View {
    var user :User?
    @StateObject var viewModel = ActiveNowViewModel()
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false){
            LazyHStack(spacing:32){
                ForEach(viewModel.users,id:\.self){item in
                    NavigationLink(value:Route.chatView(item)){
                        VStack{
                            ZStack(alignment:.bottomTrailing){
                                CircularProfileImageView(user: item, size: .medium)
    //                            Image("post4")
    //                                .resizable()
    //                                .frame(width: 50,height: 50)
    //                                .scaledToFill()
    //                                .clipShape(Circle())
                                Circle()
                                    .fill(.green)
                                    .frame(width: 15,height: 15)
                                    .overlay{
                                        Circle().stroke(.white,lineWidth: 2)
                                    }
                            }
                           
                            Text(item.firstName)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    
                    
                }
            }
        }
        .frame(height:120)
        .padding(.leading,10)
    }
}

#Preview {
    ActiveView(user: User.MOCK_USER)
}
