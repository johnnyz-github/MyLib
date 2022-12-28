//
//  PicIslandViewModel.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 27/12/2022.
//

import Foundation
class PicIslandViewModel : ObservableObject {
    @Published var icons = [IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "Policy", selected: true)
                            , IconModel(id : 2 , systemName: "airplane", picName:"goldengate",  title: "Trip" , selected: false)
                            , IconModel(id : 3 , systemName: "bus", picName:"pyramid", title: "Login/Register" , selected: false)
                            , IconModel(id : 4 , systemName: "car", picName:"chinese", title: "Covid" , selected: false)
                            , IconModel(id : 5 , systemName: "bicycle",picName:"egypt",  title: "T & C" , selected: false)
                            , IconModel(id : 6 , systemName: "scooter",picName:"effle",  title: "Message" , selected: false)
                            , IconModel(id : 7 , systemName: "hand.thumbsup",picName:"tilttower",  title: "alerts" , selected: false)
                            , IconModel(id : 8 , systemName: "line.3.horizontal",picName:"india",  title: "Near Me" , selected: false)
                            , IconModel(id : 9 , systemName: "cloud",picName:"sun",  title: "Emergency" , selected: false)
                            , IconModel(id : 10 , systemName: "moon", picName:"scooba", title: "Crime" , selected: false)
                            , IconModel(id : 11, systemName: "sun.max",picName:"beach",  title: "Risk" , selected: false)
                            , IconModel(id : 12 , systemName: "globe", picName:"tilttower", title: "Setting" , selected: false)]
    var selectedIcon : IconModel{
        icons.first{ $0.selected} ?? defaultIcon
    }
    let defaultIcon = IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "Policy", selected: true)
}
