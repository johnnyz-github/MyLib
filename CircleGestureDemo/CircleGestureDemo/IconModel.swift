//
//  IconModel.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 27/12/2022.
//

import Foundation
struct IconModel : Identifiable{
    let id: Int
    let systemName : String
    let picName : String
    let title : String
    var selected : Bool
    let requirements : [RequirementType]
}
