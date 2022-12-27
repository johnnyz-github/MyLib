//
//  ContentView.swift
//  CapsuleDemo
//
//  Created by Johnny1 on 18/12/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Text("Hello, world!") .padding()
            VStack{
                floatingPermission
                Spacer()
            }
        }
    }
    var floatingPermission: some View {
        VStack {
            Button(action: {
                let url = NSURL(string:"prefs:root=Privacy&path=LOCATION")! as URL
                        UIApplication.shared.open(url)
            }) {
                HStack {
                    Text("Location Access/GPS enabled").bold()
                    Image(systemName:  "chevron.right.circle.fill")
                }
            }
            
            .padding(.top, 16)
            Button(action: { if let BUNDLE_IDENTIFIER = Bundle.main.bundleIdentifier,
                                    let url = URL(string: "\(UIApplication.openSettingsURLString)&path=LOCATION/\(BUNDLE_IDENTIFIER)")
                {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }) {
                HStack {
                    Text("Location Permission enabled").bold()
                    Image(systemName:  "xmark")
                }
            }
        }
        .background(
        Capsule().fill(Color.blue)
            .frame(width: 300, height: 40, alignment: .topLeading),
        alignment: .top
        
        )
//        .frame(width: 300)
        .foregroundColor(.white)
        .background(Color.yellow)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
