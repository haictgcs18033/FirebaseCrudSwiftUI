//
//  LoginView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/10.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                Image("post4")
                    .resizable()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .scaledToFill()
                    .clipShape(Circle())
                InputView(text: $viewModel.email, title: "Email", placeholder: "Input your email",isSecureField: false)
                    .autocapitalization(.none)
                InputView(text: $viewModel.password, title: "Password", placeholder: "Input your password",isSecureField: true)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Forget password")
                })
                .frame(maxWidth: .infinity,alignment: .trailing)
                Button(action: {
                    Task{
                        try await viewModel.login()
                    }
                }, label: {
                    Text("Login")
                        .frame(width: 360,height: 50)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                       
                })
                HStack{
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40,height: 0.5)
                    Text("Or")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: (UIScreen.main.bounds.width/2)-40,height: 0.5)
                }
                Spacer()
                NavigationLink{
                    SignupView().navigationBarBackButtonHidden()
                }label: {
                    Text("Dont have a account Signup")
                }
              
                
                
                   
            }
            .padding()
        }
    }
}

#Preview {
    LoginView()
}
