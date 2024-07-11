//
//  SideMenuOptionalModel.swift
//  FirebaseCrud
//
//  Created by Hai Cao on 2024/06/07.
//

import Foundation

enum SideMenuOptionalModel: Int, CaseIterable{
    case dashboard
    case performance
    case profile
    case search
    case notification
    var  title:String{
        switch self{
        case .dashboard:
            return "Dashboard"
        case .performance:
            return "Performance"
        case .profile:
            return "Profile"
        case .search:
            return "Search"
        case .notification:
            return "Notification"
        }
    }
    var systemImageName:String{
        switch self {
        case .dashboard:
            return "filemenu.and.cursorarrow"
        case .performance:
            return "chart.bar"
        case .profile:
            return "person"
        case .search:
            return "magnifyingglass"
        case .notification:
            return "bell"
        }
    }
}
extension SideMenuOptionalModel:Identifiable{
    var id:Int{return self.rawValue}
}

