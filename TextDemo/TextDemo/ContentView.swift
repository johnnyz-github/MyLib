//
//  ContentView.swift
//  TextDemo
//
//  Created by Johnny1 on 5/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            myText
            myText1
            myText2
        }
    }
    var myText: some View{
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(height: 29)
            Text("dff df d rr")
                .font(.system(size: 30))
                        .minimumScaleFactor(0.01)
                .lineLimit(2)
        }
    }
    var myText1: some View{
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(height: 29)
            Text("sfsdfsafdsfasfdsfdsfsaa adsfds  asdfa a f asf asf saf  af asfa dfdf  dff df d rr")
                .font(.system(size: 20))
                        .minimumScaleFactor(0.01)
                .lineLimit(2)
        }
    }
    var myText2 : some View {
        VStack {
            Button(action: {
               
            }) {
                HStack(alignment: .top, spacing: 32) {
                    Image(systemName: "exclamationmark.shield").resizable()
                        .scaledToFit()
                        .frame(height: 29)
                    VStack(alignment: .leading, spacing: 8) {
                        Text("We can’t show alerts unless location services are enabled")
                            .minimumScaleFactor(0.01)
                            .lineLimit(2)
                            .multilineTextAlignment(.leading)
                        Text("Enable location services").foregroundColor(Color.orange)
                    }
                    .font(.system(size: 12))
                }
                .padding(.vertical, 12)
            }
        }
        .foregroundColor(.black)
        .background(Color.yellow)
//        .frame(height:60)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
