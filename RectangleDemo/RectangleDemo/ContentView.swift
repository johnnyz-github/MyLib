//
//  ContentView.swift
//  RectangleDemo
//
//  Created by Johnny1 on 9/7/2023.
//

import SwiftUI

struct ContentView: View {
    @State var progress = 0.5
    var body: some View {
        
            ZStack(alignment: .leading) {
                Rectangle().fill(Color.gray).frame(width: .infinity, height: 2)
                
                Rectangle().fill(Color.orange).frame(width: 50, height: 2)
            }
            .frame(width: .infinity, height: 2)
//            .foregroundColor(.blue)
            .background(Color.green)
            .padding()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
