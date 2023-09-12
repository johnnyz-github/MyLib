//
//  ContentView.swift
//  FetchRequestDemo
//
//  Created by Johnny1 on 23/4/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) var users : FetchedResults<User>
    var body: some View {
        VStack {
            ForEach( users, id: \.self){ user in
                HStack{
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text(" Hi \(user.name ?? "")")
                }
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
