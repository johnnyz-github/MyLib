//
//  LAPolicy.swift
//  TravelAssist
//
//  Created by Johnny Zhou on 13/10/21.
//  Copyright © 2021 CoverMore. All rights reserved.
//

import Combine
import CoreImage
import Foundation
import SwiftUI

struct LAPolicy: Equatable {
    var friendlyName: String?
    var number: String? = ""
    var destination: String?
    var startDate: Date?
    var endDate: Date?
    var policyNumber: String?
    var accessCode: String?
    var status: Int? // Check defintion in PolicyStatus
    var primaryTravellerFirstName: String?
    var primaryTravellerLastName: String?

    var underwriterCode: String? // Has values only on Travelex
    private(set) var isSelected: Bool = false
    var isValid: Bool? = false

    private var bindings = Set<AnyCancellable>()

    init() {}

    init(friendlyName: String?, number: String?, destination: String?, startDate: Date?, endDate: Date?, isSelected: Bool, status: Int?, primaryTravellerFirstName: String?, primaryTravellerLastName: String?, underwriterCode: String?) {
        self.friendlyName = friendlyName
        self.number = number
        self.destination = destination
        self.startDate = startDate
        self.endDate = endDate
        self.isSelected = isSelected
        self.status = status
        self.primaryTravellerLastName = primaryTravellerLastName
        self.primaryTravellerFirstName = primaryTravellerFirstName
        self.underwriterCode = underwriterCode
    }

    var isActive: Bool {
        status == 1
    }

    var statusEnum: PolicyStatus {
        PolicyStatus(rawValue: status ?? 0) ?? .na
    }

    mutating func select(_ selected: Bool) {
        isSelected = selected
    }

    static func == (lhs: LAPolicy, rhs: LAPolicy) -> Bool {
        lhs.policyNumber == rhs.policyNumber
    }
}

enum PolicyStatus: Int {
    case na = 0
    case active = 1
    case inactive = 2
    case expired = 3
    case cancelled = 4

    var title: String {
        switch self {
        case .na: return "N/A"
        case .active: return "ACTIVE POLICY"
        case .inactive: return "EXPIRED POLICY"
        case .expired: return "EXPIRED POLICY"
        case .cancelled: return "CANCELLED POLICY"
        default: return "N/A"
        }
    }

//    var color: Color {
//        switch self {
//        case .na: return Color.orange
//        case .active: return Color.green_apac
//        case .inactive: return Color.apacGray400
//        case .expired: return Color.apacGray400
//        case .cancelled: return Color.red_apac
//        default: return Color.orange
//        }
//    }
}

extension LAPolicy {
    static func sortLogic(_ p1: LAPolicy, _ p2: LAPolicy) -> Bool {
        guard let s1 = p1.status, let s2 = p2.status else { return false }
        if s1 != s2 {
            return displayOrder(s1) < displayOrder(s2)
        } else {
            guard let d1 = p1.startDate, let d2 = p2.startDate else { return false }
            return d1 < d2
        }
    }

    private static func displayOrder(_ policyStatus: Int) -> Int {
        switch policyStatus {
        case PolicyStatus.na.rawValue: return 100
        case PolicyStatus.active.rawValue: return 10
        case PolicyStatus.inactive.rawValue: return 20
        case PolicyStatus.expired.rawValue: return 30
        case PolicyStatus.cancelled.rawValue: return 40
        default: return 100
        }
    }
}
