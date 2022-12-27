//
//  PicIslandViewModel.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 27/12/2022.
//

import Foundation
class PicIslandViewModel : ObservableObject {
    @Published var icons = [IconModel(id: 1, systemName: "ferry",  title: "Policy", selected: true)
                            , IconModel(id : 2 , systemName: "airplane", title: "Trip" , selected: false)
                            , IconModel(id : 3 , systemName: "bus", title: "Trip" , selected: false)
                            , IconModel(id : 4 , systemName: "car", title: "Trip" , selected: false)
                            , IconModel(id : 5 , systemName: "bicycle", title: "Trip" , selected: false)
                            , IconModel(id : 6 , systemName: "scooter", title: "Trip" , selected: false)
                            , IconModel(id : 7 , systemName: "hand.thumbsup", title: "Trip" , selected: false)
                            , IconModel(id : 8 , systemName: "line.3.horizontal", title: "Trip" , selected: false)
                            , IconModel(id : 9 , systemName: "cloud", title: "Trip" , selected: false)
                            , IconModel(id : 10 , systemName: "moon", title: "Trip" , selected: false)
                            , IconModel(id : 11, systemName: "sun.max", title: "Trip" , selected: false)
                            , IconModel(id : 12 , systemName: "globe", title: "Trip" , selected: false)]
    
}
