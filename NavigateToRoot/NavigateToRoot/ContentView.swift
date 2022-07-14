//
//  ContentView.swift
//  NavigateToRoot
//
//  Created by JohnnyZ on 8/7/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var navigationHelper: NavigationHelper

        var body: some View {
            NavigationView {
                VStack {
                    Text("1st View")
                    NavigationLink(destination: SecondView(), tag: "Second", selection: $navigationHelper.selection) { EmptyView() }

                    Button("Tap to show second") {
                        self.navigationHelper.selection = "Second"
                    }
                    
                }
                .navigationBarTitle("Navigation")
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
