//
//  SecondView.swift
//  NavigateToRoot
//
//  Created by JohnnyZ on 8/7/2022.
//

import SwiftUI

struct SecondView: View {
    @EnvironmentObject var navigationHelper: NavigationHelper
    @State var isActive = false
    var body: some View {
        Text("2nd view")

        NavigationLink(destination: ThirdView(),isActive: $isActive) { EmptyView() }
        
        Button("Go to 3rd view"){
            isActive = true
        }
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
