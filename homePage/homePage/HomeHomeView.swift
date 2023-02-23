//
//  HomeHomeView.swift
//  homePage
//
//  Created by Johnny1 on 23/2/2023.
//

import SwiftUI

struct HomeHomeView: View {
//    @StateObject var account: Account
//    @StateObject var policyViewModel: PolicyViewModel
//    @StateObject var alertNearmeViewModel: AlertViewModel
    var name = "zhouhong"
    var backColor = Color.blue
    @State var index = 0
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 0) {
                VStack{
                    Image("Logo_travelex")
                        .foregroundColor(.white)
                    salutionView
                        .foregroundColor(.white)
                        
                    policysTileCarousel
                }
                .padding()
                .background( backColor )
                ArcBottomShape(radius: 10)
                    .foregroundColor(backColor)
                middlePart
                TripTileView()
            }
        }
        .onAppear {
//            policyViewModel.loadPolicyList()
        }
    }

    var salutionView: some View {
        HStack{
            VStack(alignment: .leading) {
                Text("Hey").font(.system(size: 28)) + Text(" \(name)!")
                    .font(.system(size: 28, weight: .bold))
                Text("Dream, Explore, Travel On")
                    .font(.system(size: 15))
            }
            Spacer()
        }
    }

    var policysTileCarousel: some View {

        return AnyView(
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(policyList, id: \.self) { item in
                        PolicyTileView()
                            .frame(width: 279, height: 177)
                    }
                }
                .background(backColor)
            }
        )
    }
    
    var middlePart: some View{
            HStack(spacing: 20) {
                SosTileView()
                    .frame(height: 205)

                AlertNearMeTileView()
                    .frame(height: 205)
            }
            .padding()
    }
    var policyList = ["policy1", "policy2","policy3"]
        
    
}

struct HomeHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeHomeView()
    }
}
