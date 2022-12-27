//
//  ContentView.swift
//  backgroundDemo
//
//  Created by Johnny1 on 6/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            summary.padding(.horizontal, 16)
            ScrollView(.vertical, showsIndicators: true) {
                VStack(alignment: .leading, spacing: 15) {
                    
                    Group {
                        description
                        Divider().overlay(Color.white)
                        locations
                        Divider().overlay(Color.white)
                        locations
                        Divider().overlay(Color.white)
                        locations
                        Divider().overlay(Color.white)
                    }
                    Spacer()
//                    VStack(spacing: 40) {}
//                        .padding(.horizontal, 16)
//                        .frame(width: UIScreen.main.bounds.width)
//                        .foregroundColor(.white)
//                        .background(
//                            Color.yellow
//                        )
                }
                
                .background(backColor)
                .padding()
            }
        }
        .background(Color.yellow)
    }
    var locations: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Location(s)").fontWeight(.bold)
            Text("yuyy  uy u uyyu uu u uy u u u yuu u u  u  uu u u y u u u")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
    var description: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Location(s)").fontWeight(.bold)
            Text("yuyy  uy u uyyu uu u uy u u u yuu u u  u  uu u u y u u u sfds fsdf sdf sf sf sf sdf sf sf sf sf sf sdf sf sddf sf sf sf sdf sddf sdf sf sf sf sf sf sdf sdf sdf sdf sdfkjfg af as;df  gadfg ;sdfg adf saf asf sa d as fasdf asf adsf a;af djas;df jasdf as;df asdf asdf asfd jasf af askf asf aaf asf asf hasf asdkljfadhsf asf aslhfasf gaslfhaf asdlafds ")
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 16)
    }
    var summary : some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text("Begin:")
                    .fontWeight(.bold)

                Text("sfda asdf ")
                Spacer()
            }
        }
    }
    let backColor = Color.gray
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
