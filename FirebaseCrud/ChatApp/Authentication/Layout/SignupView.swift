//
//  SignupView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/10.
//

import SwiftUI

struct SignupView: View {
  
    @StateObject var viewModel = RegisterViewModel()
    @Environment(\.dismiss) var dismiss
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
                InputView(text: $viewModel.name, title: "Name", placeholder: "Input your name",isSecureField: false)
                    .autocapitalization(.none)
                
                Button(action: {
                    Task{
                        try await viewModel.createUser()
                    }
                }, label: {
                    Text("Signup")
                        .frame(width: 360,height: 50)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                       
                })
               
                Spacer()
                Button(action:{
                   dismiss()
                },label: {
                    Text("Already have a account ? Signin")
                })
                
                
                   
            }
            .padding()
        }
    }
}

#Preview {
    SignupView()
}
