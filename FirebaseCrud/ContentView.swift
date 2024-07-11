//
//  ContentView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/06.
//

import SwiftUI
import SwiftData

struct ContentView: View {
   @StateObject var viewModel = ContentViewModel()
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                InboxView()
            }else{
                LoginView()
            }
        }
    }
}


#Preview{
    ContentView()
}


