//
//  Tab.swift
//  AnapaBonus
//
//  Created by Дмитрий Цепилов on 13.07.2024.
//

import SwiftUI


enum Tab: String, CaseIterable {
    case people, device, me

    var displayName: String {
        switch self {
        case .people:
            return "Афиша"
        case .device:
            return "Бонусы"
        case .me:
            return "Профиль"
        }
    }

    var image: Image {
        switch self {
        case .people:
            return Image("poster1")
        case .device:
            return Image("point1")
        case .me:
            return Image("user1")
        }
    }
    
}
/*enum Tab: String, CaseIterable {
    case people = "Афиша"
    case device = "Бонусы"
  //  case items = ""
    case me = "Профиль"
    
    var systemImage: Image {
        switch self {
        case .people:
            return Image(systemName: "point")
        case .device:
            return Image(systemName: "point")
        case .me:
            return Image(systemName: "point")
        }
    }
    
} */


/* struct Tab: Identifiable {
    var id: Int
    var symbolImage: String
    var rect: CGRect = .zero
}

let systemImage: [Tab] = [
    .init(id:0, symbolImage: "point"),
    .init(id:1, symbolImage: "point"),
    .init(id:2, symbolImage: "point")
]
*/
