//
//  ContentView.swift
//  PickerDemo
//
//  Created by Johnny Zhou on 28/3/2023.
//

import SwiftUI

struct ContentView: View {
    var colors = ["R", "G", "B", "T"]
        @State private var selectedColor = "R"

        var body: some View {
            VStack {
                Picker("Please choose a color", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
//                            .rotationEffect(Angle(degrees: 90))
                    }
                }
                .rotationEffect(Angle(degrees: -90))
                Text("You selected: \(selectedColor)")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
