//
//  FourthView.swift
//  NavigateToRoot
//
//  Created by JohnnyZ on 8/7/2022.
//

import SwiftUI

struct FourthView: View {
    @EnvironmentObject var navigationHelper: NavigationHelper
    var body: some View {
        Text("4th view")
//        NavigationLink(destination: SecondView(), tag: "Second", selection: $navigationHelper.selection) { EmptyView() }
        Button("Go to 2nd View"){
            self.navigationHelper.selection = "Second"
        }
        Button("Go to Root"){
            self.navigationHelper.selection = nil
        }
    }
}

struct FourthView_Previews: PreviewProvider {
    static var previews: some View {
        FourthView()
    }
}
