//
//  Nav1.swift
//  NavigationBarDemo
//
//  Created by Johnny Zhou on 23/5/2023.
//

import SwiftUI

struct Nav1: View {
    var body: some View {
        
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            
            .navigationBarColor(backgroundColor: Color.red, titleColor: Color.black)
                    .navigationBarTitleDisplayMode(.inline)
    }
}

struct Nav1_Previews: PreviewProvider {
    static var previews: some View {
        Nav1()
    }
}
