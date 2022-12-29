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
    var description : String {
        switch self {
        // Use Internationalization, as appropriate.
        case .login: return "login"
        case .policy: return "policy"
        case .location: return "location"
        case .trip: return "trip"
        case .mobile: return "mobile"
        }
      }
}
