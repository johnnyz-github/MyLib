//
//  SecondView.swift
//  DemoLifeCycle
//
//  Created by Johnny Zhou on 26/9/2023.
//

import Foundation
import SwiftUI

struct SecondView: View {
    var body: some View{
        VStack{
            Text("Second View")
        }
        .onAppear {
            print("second view appear")
        }
    }
}
