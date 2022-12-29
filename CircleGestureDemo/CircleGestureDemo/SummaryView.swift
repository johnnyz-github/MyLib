//
//  SummaryView.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 28/12/2022.
//

import SwiftUI
import SSSwiftUIGIFView
struct SummaryView: View {
    var model : IconModel
    
    var body: some View {

        VStack{
            Text("\(model.title)")
            ZStack{
                Image(model.title)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                TaskView(model : model)
                }
        }

    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(model: IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "policy", selected: true, requirements: [.login]))
    }
}
