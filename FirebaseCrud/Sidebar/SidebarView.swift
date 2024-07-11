//
//  SidebarView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/07.
//

import SwiftUI

struct SidebarView: View {
    @State var isShowing = false
    @State var selectedTab = 0
    var arrayTitle = ["Dashboard","Performance","Profile","Search","Notification"]
    func renderTitle()-> String{
        for i in 0..<arrayTitle.count{
            return arrayTitle[selectedTab]
        }
        return ""
    }
    var body: some View {
        NavigationStack{
            ZStack{
                TabView(selection: $selectedTab,
                        content:  {
                    Text("Dashboard").tag(0)
                    Text("Performance").tag(1)
                    Text("Profile").tag(2)
                    Text("Search").tag(3)
                    Text("Notification").tag(4)
                })
                SideMenuVIew(isShowing:$isShowing,selectedTab: $selectedTab)
            }
            .navigationTitle(renderTitle())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(isShowing ? .hidden : .visible )
            .toolbar{
                ToolbarItem(placement:.topBarLeading){
                    Button(action:{
                        isShowing.toggle()
                    },label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
            
        }
        
        
    }
}

#Preview {
    SidebarView()
}
