//
//  SettingOptionViewModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/09.
//

import Foundation
import SwiftUI
enum SettingOptionViewModel:Int,Identifiable,CaseIterable{
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notifications
    var title : String{
        switch self{
       
        case .darkMode:
            return "Dark mode"
        case .activeStatus:
            return "Active Status"
        case .accessibility:
            return "Accessibility"
        case .privacy:
            return "Privacy"
        case .notifications:
            return "Notification"
        }
    }
    var imageName: String{
        switch self{
        case .darkMode:
            return "moon.circle.fill"
        case .activeStatus:
            return "message.badge.circle.fill"
        case .accessibility:
            return "person.circle.fill"
        case .privacy:
            return "lock.circle.fill"
        case .notifications:
            return "bell.circle.fill"
        }
    }
    var imageBackground: Color {
        switch self{
        case .darkMode:
            return Color.black
        case .activeStatus:
            return Color.green
        case .accessibility:
            return Color.black
        case .privacy:
            return Color.blue
        case .notifications:
            return Color.purple
        }
    }
    var id: Int{
        return self.rawValue
    }
    
}
