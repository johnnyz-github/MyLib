//
//  LoginView.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 30/12/2022.
//

import SwiftUI

struct LoginView: View {
    @State var name : String
    @State var password : String
    var body: some View {
        VStack(alignment: .center, spacing: 16){
            HStack{
                Text("name")
                TextField("name: ", text: $name)
                    .frame(width: 200, height: 40, alignment: .center)
            }
            HStack{
                Text("Password: ")
                TextField("password", text: $password)
                    .frame(width: 200, height: 40, alignment: .center)
            }
            
            Spacer()
            Button(action: {
                
            }){
                Capsule().fill(.orange)
                    .frame(width: 200, height: 40, alignment: .center)
                    .overlay(Text("Login").foregroundColor(.white))
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(name: "Johnny Zhou", password: "12345678")
    }
}
