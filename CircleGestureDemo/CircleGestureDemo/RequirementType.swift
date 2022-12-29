//
//  Requirements.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 29/12/2022.
//

import Foundation

enum RequirementType{
    case login
    case policy
    case location
    case trip
    case mobile
    case notification
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .login: return "need login"
        case .policy: return "need 1 policy"
        case .location: return "need location permission"
        case .trip: return "need 1 trip"
        case .mobile: return "need mobile number"
        case .notification: return "neec notification permission"
        }
      }
}
