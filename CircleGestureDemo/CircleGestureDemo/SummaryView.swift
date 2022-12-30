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

        NavigationLink(destination: self.getDestination(itemText: model.title)) {
            VStack{
                
                    Text("\(model.title)")
                    
                ZStack{
                    Image(model.title)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                   Image("demo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 50, alignment: .center)
                    RequirementView(model : model)
                    }
            }
        }
        
    }
    func getDestination(itemText: String) -> AnyView {

        if model.title == "policy"{
            return AnyView(PolicyView())
        }else if model.title == "login"{
            return AnyView(LoginView(name: "", password: ""))
        }else if model.title == "trip"{
            return AnyView(TripView())
        }else if model.title == "alert"{
            return     AnyView(AlertView())
        }else if model.title == "nearme"{
            return AnyView(NearMeView())
        }else{
            return AnyView(EmptyView())
        }
//        return AnyView(EmptyView())
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(model: IconModel(id: 1, systemName: "ferry", picName:"liberty",  title: "policy", selected: true, requirements: [.login]))
    }
}
