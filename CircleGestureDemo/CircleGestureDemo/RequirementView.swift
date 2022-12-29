//
//  TaskView.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 29/12/2022.
//

import SwiftUI

struct RequirementView: View {
    var model : IconModel
    var body: some View {
        
        VStack{
            ForEach( model.requirements, id: \.self) { requirement in
                Capsule()
                    .fill(.blue)
                    .frame(width: 150, height: 20)
                    
                    .overlay(
                        Text("\(requirement.description)"))
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding(.top, 50)
    }
}

struct RequirementView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementView(model: IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "Policy", selected: true, requirements: [.login]))
    }
}
