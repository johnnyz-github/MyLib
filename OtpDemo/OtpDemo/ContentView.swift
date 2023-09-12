//
//  ContentView.swift
//  OtpDemo
//
//  Created by Johnny1 on 1/6/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @State var otp = "    "
    let OTP_CODE_LENGTH = 4
    @ObservedObject var phoneViewModel: PhoneViewModel
    @FocusState private var focusedField: FocusField?
    init(phoneViewModel: PhoneViewModel){
        self.phoneViewModel = phoneViewModel
    }
    var body: some View {
        VStack{
            descriptionField
            pinField
                .padding()
            Spacer()
            buttonField
        }
    }
    
    var pinField: some View {
        ZStack(alignment: .center) {
                    backgroundTextField
                    HStack {
                        ForEach(0..<OTP_CODE_LENGTH) { index in
                            ZStack {
                                
                                RoundedRectangle(cornerRadius:  CGFloat(5.0))
                                    .frame(height: 50)
                                    .foregroundColor(Color.white)
                                    .padding(.trailing, 5)
                                    .padding(.leading, 5)
                                    .border( .green)
//                                    .opacity(phoneViewModel.pin.count <= index ? 1 : 0)
                                Text(phoneViewModel.getPin(at: index))
                                    .font(Font.system(size: 27))
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color.blue)
                            }
                        }
                    }
                }
    }
    var descriptionField: some View{
        HStack{
            Text("here is the description").font(.system(size: 20))
                .padding()
                .foregroundColor(.blue)
            Spacer()
        }
        
    }
    var buttonField: some View {
        Button(action: {}){
            RoundedRectangle(cornerRadius: 5)
                .fill(Color.orange)
                .overlay(Text("Submit"))
                .frame(height: 50)
                .padding(.horizontal, 50)
                .padding(.vertical)
        }
    }
    enum FocusField: Hashable {
            case field
        }
        
        
        
        
        private var backgroundTextField: some View {
            return TextField("", text: $phoneViewModel.pin)
                .frame(width: 0, height: 0, alignment: .center)
                .font(Font.system(size: 0))
//                .accentColor(.blue)
//                .foregroundColor(.blue)
//                .multilineTextAlignment(.center)
                .keyboardType(.numberPad)
                .onReceive(Just(phoneViewModel.pin)) { _ in phoneViewModel.limitText(OTP_CODE_LENGTH) }
                .focused($focusedField, equals: .field)
                .task {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5)
                    {
                        self.focusedField = .field
                    }
                }
                .padding()
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(phoneViewModel: PhoneViewModel())
    }
}
