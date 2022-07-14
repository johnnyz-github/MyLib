//
//  ThirdView.swift
//  NavigateToRoot
//
//  Created by JohnnyZ on 8/7/2022.
//

import SwiftUI

struct ThirdView: View {
    @State var isActive = false
    @EnvironmentObject var navigationHelper: NavigationHelper
    var body: some View {
        Text("3rd view")
        NavigationLink(destination: FourthView(),isActive: $isActive) { EmptyView() }
        Button("Go to Previous"){
            self.navigationHelper.selection = "Second"
        }
        Button("Go to 4th View"){
            isActive = true
        }
        Button("Go to Root"){
            self.navigationHelper.selection = nil
        }
    }
}

struct ThirdView_Previews: PreviewProvider {
    static var previews: some View {
        ThirdView()
    }
}
