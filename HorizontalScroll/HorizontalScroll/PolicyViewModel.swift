//
//  PolicyViewModel.swift
//  HorizontalScroll
//
//  Created by Johnny1 on 9/3/2023.
//

import Foundation
class PolicyViewModel{
    var activePolicies = [LAPolicy(number: "12345", status: 1, startDate: Date.now, endDate: Date.now, isSelected: true, destination: "India")]
    var nonActivePolicies = [LAPolicy(number: "54321", status: 3, startDate: Date.now, endDate: Date.now, isSelected: true, destination: "China"),
                              LAPolicy(number: "22345", status: 4, startDate: Date.now, endDate: Date.now, isSelected: true, destination: "Spain"),
                              LAPolicy(number: "32345", status: 2, startDate: Date.now, endDate: Date.now, isSelected: true, destination: "Burma")]
}
struct LAPolicy{
    let  number: String
    let status : Int
    let startDate: Date
    let endDate : Date
    let isSelected : Bool
    let destination : String
}
