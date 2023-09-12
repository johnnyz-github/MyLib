//
//  Demo1.swift
//  LifeCycleDemo
//
//  Created by Johnny Zhou on 31/5/2023.
//

import SwiftUI

struct Demo1: View {
    @Environment(\.managedObjectContext) var dbContext
    @FetchRequest(sortDescriptors: []) var entity1 : FetchedResults<Entity1>
    init(){
        print("Demo1 inited.")
        
    }
    var body: some View {
        VStack{
            ForEach(entity1, id: \.name){ entity in
                Text(entity.name ?? "N/A")
            }
            NavigationLink(destination: Demo2()){
                Text("Demo2")
            }
        }.onAppear{
            var entity = Entity1(context: dbContext)
            entity.name = "xxxx"
            try? dbContext.save()
        }
    }
}

struct Demo1_Previews: PreviewProvider {
    static var previews: some View {
        Demo1()
    }
}
