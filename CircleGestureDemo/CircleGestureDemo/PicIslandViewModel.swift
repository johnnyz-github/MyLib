//
//  PicIslandViewModel.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 27/12/2022.
//

import Foundation
class PicIslandViewModel : ObservableObject {
    @Published var icons = [IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "policy", selected: true, requirements: [.login])
                            , IconModel(id : 2 , systemName: "airplane", picName:"goldengate",  title: "trip" , selected: false, requirements: [.login, .policy])
                            , IconModel(id : 3 , systemName: "bus", picName:"pyramid", title: "login" , selected: false, requirements: [])
                            , IconModel(id : 4 , systemName: "car", picName:"chinese", title: "covid" , selected: false, requirements: [.login, .trip])
                            , IconModel(id : 5 , systemName: "bicycle",picName:"egypt",  title: "intelligence" , selected: false, requirements: [.login, .trip])
                            , IconModel(id : 6 , systemName: "scooter",picName:"effle",  title: "profile" , selected: false, requirements: [.login])
                            , IconModel(id : 7 , systemName: "hand.thumbsup",picName:"tilttower",  title: "alert" , selected: false, requirements: [.login, .trip])
                            , IconModel(id : 8 , systemName: "line.3.horizontal",picName:"india",  title: "nearme" , selected: false, requirements: [.login, .location])
                            , IconModel(id : 9 , systemName: "cloud",picName:"sun",  title: "assistance" , selected: false, requirements: [])
                            , IconModel(id : 10 , systemName: "moon", picName:"scooba", title: "claim" , selected: false, requirements: [.policy])
                            , IconModel(id : 11, systemName: "sun.max",picName:"beach",  title: "intelligence" , selected: false, requirements: [.login, .trip])
                            , IconModel(id : 12 , systemName: "globe", picName:"tilttower", title: "Setting" , selected: false, requirements: [])]
    var selectedIcon : IconModel{
        icons.first{ $0.selected} ?? defaultIcon
    }
    func setSelectedIcon( _ index : Int){
        for (i, icon) in icons.enumerated() {
            icons[i].selected = false
        }
        icons[index].selected = true
    }
    let defaultIcon = IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "Policy", selected: true, requirements: [.login])
}
