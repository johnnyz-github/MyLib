//
//  SwiftUIView.swift
//  NavigationDemo
//
//  Created by Johnny1 on 30/1/2023.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
            VStack{
                Text("Hello, World!")
                Spacer()
            }
//            .edgesIgnoringSafeArea(.bottom)
//        .navigationBarTitle("Login", displayMode: .inline)
        .background(Color.blue)
        
//        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
