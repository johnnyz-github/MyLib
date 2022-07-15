//
//  ContentView.swift
//  arc
//
//  Created by JohnnyZ on 4/5/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Text("Title")
            CovidInfoPanel()
        }
        
    }
    struct CovidInfoPanel : View{
        @State var selectedTab : Int
        @State var risks : [Covid.RiskRating]
        init(){
            selectedTab = 0
            risks = [Covid.RiskRating(id: 1, name: "Risk Level", rating: 0.6),
                     Covid.RiskRating(id: 2, name: "Infection Level", rating: 0.8),
                     Covid.RiskRating(id: 3, name: "Fully Vaccinated", rating: 0.64)]
        }
        var body: some View{
            VStack{
                HStack{
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.orange)
                        .overlay(
                            HStack{
                            Text("Pre-departure")
                            Image(systemName: "airplane.departure")
                            },
                            alignment: .center
                        )
                        .onTapGesture {
                            selectedTab = 0
                        }
                    RoundedRectangle(cornerRadius: 5)
                        .foregroundColor(.gray)
                        .overlay(
                            HStack{
                            Text("Arrival")
                            Image(systemName: "airplane.arrival")
                            },
                            alignment: .center
                        )
                        .onTapGesture {
                            selectedTab = 1
                        }
                }
                .frame(width: 200, height: 30, alignment: .center)
                .offset(x: 0, y: -15)
                .padding(.horizontal, 50)
                HStack{
                    Image(systemName: "mappin")
                        .foregroundColor(.orange)
                    Text("USA").font(.largeTitle)
                }
                Divider()
                RiskPanel(risks: risks)
                Spacer()
            }
            .background(Color.white)
            //.foregroundColor(.black)
            .mask(ArcTopShape(radius: 20))
            .shadow(color: .gray, radius: 0, x: 0, y: -4)
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    struct RiskPanel : View{
        var risks : [Covid.RiskRating]
        var body: some View{
            HStack{
                ForEach (risks ){ risk in
                    RiskCircle(risk: risk)
                    
                }
                
            }
            VStack{
                
                CovidLink(name: "COVID - Hotspots", caption: "Subheader blurb")
                Divider()
                CovidLink(name: "Your airline", caption: "Subheader blurb")
                Divider()
                CovidLink(name: "COVID - exit requirements", caption: "Subheader blurb")
            }
            .padding()
        }
    }
    struct RiskCircle : View {
        var risk : Covid.RiskRating
        var radius : CGFloat = 80
        var body: some View{
            VStack{
                ZStack{
                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke( lineWidth: 15)
                        .foregroundColor(.brown)
                        .overlay{
                            Text("6/10")
                        }
                        .frame(width: radius, height: radius, alignment: .center)
                    Circle()
                        .trim(from: 0, to: risk.rating)
                        .stroke( lineWidth: 15)
                        .foregroundColor(.red)
                        .frame(width: radius, height: radius, alignment: .center)
                }
                .padding()
                Text(risk.name).font(.caption)
            }
        }
    }
    struct CovidLink : View {
        var name : String
        var caption : String
        var body: some View {
            HStack{
                Image(systemName: "airplane")
                Text(name).font(.title2)
                Spacer()
                Button(action: {}){
                    Image(systemName: "chevron.right")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
