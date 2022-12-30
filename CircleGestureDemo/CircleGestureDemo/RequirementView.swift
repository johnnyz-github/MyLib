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
                NavigationLink(destination: self.getDestination(requirement)) {
                Capsule()
                    .fill(.blue)
                    .frame(width: 150, height: 20)
                    
                    .overlay(
                        Text("\(requirement.description)"))
                    .foregroundColor(.white)
                }
            }
            Spacer()
        }
        .padding(.top, 50)
    }
    func getDestination(_ requirement: RequirementType) -> AnyView {
        switch requirement{
            case .login:
                return AnyView(LoginView(name: "", password: ""))
            case .policy:
            return AnyView(PolicyView())
            case .location:
            return AnyView(LocationPermissionView())
            case .trip:
            return AnyView(TripView())
            case .mobile:
            return AnyView(ProfileView())
            case .notification:
            return AnyView(NotificationPermission())
            
                
            }
    }
}

struct RequirementView_Previews: PreviewProvider {
    static var previews: some View {
        RequirementView(model: IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "Policy", selected: true, requirements: [.login]))
    }
}
