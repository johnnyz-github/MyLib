//
//  SummaryView.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 28/12/2022.
//

import SwiftUI

struct SummaryView: View {
    var model : IconModel
    
    var body: some View {
        
            VStack{
                Text("\(model.title)")
                Image("nearme")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(model: IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "Policy", selected: true))
    }
}
