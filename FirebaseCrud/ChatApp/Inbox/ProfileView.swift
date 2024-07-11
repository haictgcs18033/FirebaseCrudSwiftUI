//
//  ProfileView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import SwiftUI
import PhotosUI
struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModal()
    let user : User
    var body: some View {
        VStack{
            PhotosPicker(selection: $viewModel.selectedItem , label: {
                if let profileImage = viewModel.profileImage{
                    profileImage
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                        .clipShape(Circle())
                }else{
                    CircularProfileImageView(user:user,size: .xLarge)
                }
            
           })
            Text(user.fullName)
                .font(.title)
                .fontWeight(.bold)
            Button(action: {
                guard let image = viewModel.profileImage else{return}
                print(image)
            }, label: {
                Text("check")
            })
        }
        .onAppear{
            print("\(viewModel.profileImage)")
        }
        List{
            Section{
                
                ForEach(SettingOptionViewModel.allCases){option in
                    HStack{
                        Image(systemName:option.imageName)
                            .resizable()
                            .frame(width: 24,height: 24)
                            .foregroundColor(option.imageBackground)
                        Text(option.title)
                    }
                    
                    
                }
                
            }
            Section{
                Button(action: {
                    print("as")
                }, label: {
                    Text("Delete Account")
                })
                Button("Log out"){
                    AuthService.shared.logout()
                }
            }
            .foregroundColor(.red)
        }
    }
}

#Preview {
    ProfileView(user:User.MOCK_USER)
}
