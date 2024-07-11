//
//  SideMenuHeaderView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/07.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 48,height: 48)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            VStack{
                Text("John Wick")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title)
                Text("abc@gmail.com")
                    
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}
