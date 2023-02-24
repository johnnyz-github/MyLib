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
    var backColor = Color.apacBlue
    @State var index = 0
    var body: some View {
        ScrollView(.vertical){
            VStack(spacing: 0) {
                VStack{
                    Image("Logo_travelex")
                        .foregroundColor(.white)
                        .padding(.top, 30)
                    Divider().foregroundColor(.gray)
                    salutionView
                        .foregroundColor(.white)
                        
                    viewAllBtn
                    policysTileCarousel
                }
                .padding()
                .background( backColor )
                ArcBottomShape(radius: 20)
                    .foregroundColor(backColor)
                    .frame(height: 20)
                middlePart
                TripTileView()
            }
        }
        .ignoresSafeArea()
        .onAppear {
//            policyViewModel.loadPolicyList()
        }
    }

    var salutionView: some View {
        HStack{
            VStack(alignment: .leading, spacing: 8) {
                Text("Hey").font(.system(size: 28)) + Text(" \(name)!")
                    .font(.system(size: 28, weight: .bold))
                Text("Dream, Explore, Travel On")
                    .font(.system(size: 15))
            }
            Spacer()
        }
    }
    var viewAllBtn : some View{
        HStack{
            Spacer()
            Button(action: {}){
                Text("View all").foregroundColor(.white)
                    .font(.system(size: 13, weight: .bold))
            }
        }
    }
    var policysTileCarousel: some View {

        return AnyView(
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    ForEach(policyList, id: \.self) { item in
                        PolicyTileView()
                            .frame(width: 279)
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
