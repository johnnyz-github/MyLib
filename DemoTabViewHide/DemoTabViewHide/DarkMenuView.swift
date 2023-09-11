//
//  DarkMenuView.swift
//  DemoTabViewHide
//
//  Created by Johnny1 on 22/8/2023.
//

import SwiftUI

struct DarkMenuView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
        
        var body: some View {
            VStack{
                Picker("Mode" , selection: $isDarkMode) {
                    Text("Light")
                        .tag(false)
                    
                    Text("Dark")
                        .tag(true)
                }.pickerStyle(SegmentedPickerStyle())
                .padding()
                
                
                
                
                List(0..<5, id: \.self) { num in
                                NavigationLink(destination: Text("\(num)")) {
                                Text("\(num)")
                                    
                                }
                                    
                            }
            }.navigationTitle("Dark Menu")
            
           
        }
}

struct DarkMenuView_Previews: PreviewProvider {
    static var previews: some View {
        DarkMenuView()
    }
}
