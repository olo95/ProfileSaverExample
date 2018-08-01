//
//  ColorTheme.swift
//  ProfileSaverExample
//
//  Created by Alexander Stolar on 01/08/2018
//  Copyright © 2018 Alexander Stolar. All rights reserved.
//

import UIKit

enum ColorTheme {
    
    case primary
    case primaryVariant
    case secondary
    case secondaryVariant
    case background
    case surface
    case error
    case onPrimary
    case onSecondary
    case onBackground
    case onSurface
    case onError
    
    var value: UIColor {
        switch self {
        case .primary: return #colorLiteral(red: 1, green: 0.4127518833, blue: 0.005145791918, alpha: 1)
        case .primaryVariant: return #colorLiteral(red: 1, green: 0.8003414273, blue: 0.6629311442, alpha: 1)
        case .secondary: return #colorLiteral(red: 0.8090102077, green: 0.2088997662, blue: 0.2082743347, alpha: 1)
        case .secondaryVariant: return #colorLiteral(red: 0.8362993598, green: 0.40828982, blue: 0.407977879, alpha: 1)
        case .background: return #colorLiteral(red: 0.9607420564, green: 0.9608135819, blue: 0.964579165, alpha: 1)
        case .surface: return #colorLiteral(red: 0.9999478459, green: 1, blue: 0.9998740554, alpha: 1)
        case .error: return #colorLiteral(red: 0.8090102077, green: 0.2088997662, blue: 0.2082743347, alpha: 1)
        case .onPrimary: return #colorLiteral(red: 0.1019530371, green: 0.101966165, blue: 0.10194204, alpha: 1)
        case .onSecondary: return #colorLiteral(red: 0.9002146546, green: 0.9113284158, blue: 0.9113284158, alpha: 1)
        case .onBackground: return #colorLiteral(red: 0.631447196, green: 0.6000415683, blue: 0.5999302268, alpha: 1)
        case .onSurface: return #colorLiteral(red: 0.1019530371, green: 0.101966165, blue: 0.10194204, alpha: 1)
        case .onError: return #colorLiteral(red: 0.9880785346, green: 1, blue: 0.9685420394, alpha: 1)
        }
    }
}
