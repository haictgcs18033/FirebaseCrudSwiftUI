//
//  SideMenuRoleView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/07.
//

import SwiftUI

struct SideMenuRoleView: View {
     var option : SideMenuOptionalModel
    @Binding var selectedOption: SideMenuOptionalModel?
    private var isSelected : Bool{
        return selectedOption == option
    }
    var body: some View {
        HStack{
            Image(systemName: option.systemImageName)
                .imageScale(.small)
            Text(option.title)
            Spacer()
        }
        .padding()
        .foregroundStyle(isSelected ? .blue : .primary)
        .frame(width:216,height: 40)
        .background(isSelected ? .blue.opacity(0.25) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SideMenuRoleView(option: .dashboard ,selectedOption: .constant(.dashboard))
}
