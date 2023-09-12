//
//  ContentView.swift
//  LifeCycleDemo
//
//  Created by Johnny Zhou on 31/5/2023.
//

import SwiftUI

struct ContentView: View {
    let dbContext = DbManager.shared.container.viewContext // main thread
    init(){
        print("ContentView inited")
    }
    var body: some View {
        NavigationView{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
                NavigationLink(destination: Demo1()){
                    Text("Demo1")
                }
            }
            .padding()
            .environment(\.managedObjectContext, dbContext)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
