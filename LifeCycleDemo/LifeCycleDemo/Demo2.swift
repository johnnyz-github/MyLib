//
//  Demo2.swift
//  LifeCycleDemo
//
//  Created by Johnny Zhou on 31/5/2023.
//

import SwiftUI

struct Demo2: View {
    init(){
        print("Demo2 inited.")
    }
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Demo2_Previews: PreviewProvider {
    static var previews: some View {
        Demo2()
    }
}
