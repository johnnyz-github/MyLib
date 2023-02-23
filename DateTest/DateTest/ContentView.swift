//
//  ContentView.swift
//  DateTest
//
//  Created by Johnny1 on 3/2/2023.
//

import SwiftUI

struct ContentView: View {
    var date : Date {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        let date = Calendar.current.date(from: components)
        return date!
    }
    var body: some View {
        VStack{
        Text("Date with stripped time: \(date) ")
            .padding()
        Text("Current dateTime: \(Date()) ")
            .padding()
        }
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
