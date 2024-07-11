//
//  InputView.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/11.
//

import SwiftUI

struct InputView: View {
    @Binding var text:String;
    let title: String;
    let placeholder: String;
    var isSecureField = true;
    var body: some View {
        VStack(alignment:.leading,spacing: 12){
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            if isSecureField {
                SecureField(placeholder,text: $text)
                    .font(.system(size: 15))
            }else{
                TextField(placeholder,text: $text)
                    .font(.system(size: 15))
                    .onChange(of: text){newText in
                        self.text = newText.lowercased()
                    }
            }
            Divider()
        }
    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@gmail.com")
}
