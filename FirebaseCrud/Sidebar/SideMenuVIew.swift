//
//  SideMenuVIew.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/07.
//

import SwiftUI

struct SideMenuVIew: View {
    @Binding var isShowing:Bool
    @State var selectedOption:SideMenuOptionalModel?
    @Binding var selectedTab : Int
    var body: some View {
        ZStack{
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack{
                    VStack(alignment:.leading,spacing: 32){
                        SideMenuHeaderView()
                        VStack{
                            ForEach(SideMenuOptionalModel.allCases){option in
                                Button(action: {
                                    print(option)
                                   onOptionTap(option)
                                }, label: {
                                    SideMenuRoleView(option: option,selectedOption: $selectedOption)
                                })
                            }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width:270,alignment: .leading)
                    .background(Color.white)
                   
                    Spacer()
                }
                .transition(.move(edge: .leading))
            }
        }
       
        .animation(.easeInOut, value: isShowing)
    }
    private func onOptionTap(_ option : SideMenuOptionalModel){
        selectedOption = option
        selectedTab = option.rawValue
        isShowing=false
    }
}

#Preview {
    SideMenuVIew(isShowing: .constant(true),selectedTab: .constant(0))
}
