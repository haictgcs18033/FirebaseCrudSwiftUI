//
//  ChatBurble.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/10.
//

import SwiftUI

struct ChatBurble: Shape {
    let isFromCurrentUser:Bool
    func path(in rect:CGRect)-> Path{
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [
                .topLeft,
                .topRight,
                isFromCurrentUser ? .bottomLeft : . bottomRight
            ],
            cornerRadii: CGSize(width: 16, height: 16))
        return Path(path.cgPath)
    }
}

#Preview {
    ChatBurble(isFromCurrentUser: true)
}
