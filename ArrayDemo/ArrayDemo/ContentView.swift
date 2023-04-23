//
//  ContentView.swift
//  ArrayDemo
//
//  Created by Johnny1 on 23/3/2023.
//

import SwiftUI

struct ContentView: View {
    var viewModel = ArrayViewModel()
    var body: some View {
        VStack {

            ForEach(viewModel.activePolicies, id: \.number!) {policy in
                HStack{
                    Text("policy: \(policy.number!), \(policy.startDate!), \(policy.endDate!)")
                        .padding()
                }
            }
            Text("sosNumber : \(viewModel.sosNumber)")
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
