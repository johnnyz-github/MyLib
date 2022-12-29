//
//  TaskView.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 29/12/2022.
//

import SwiftUI

struct TaskView: View {
    var model : IconModel
    var body: some View {
        
        VStack{
            ForEach( model.requirements, id: \.self) { requirement in
                Capsule()
                    .fill(.green)
                    .frame(width: 150, height: 30)
                    .overlay(
                        Text("\(requirement.description)"))
            }
            
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(model: IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "Policy", selected: true, requirements: [.login]))
    }
}
