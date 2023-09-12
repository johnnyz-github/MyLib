//
//  ContentView.swift
//  TextFieldDemo
//
//  Created by Johnny1 on 11/9/2023.
//

import SwiftUI

struct ContentView: View {
    @Binding var text: String
    @Binding var isActivated: Bool
    @State var name : String = ""
    @FocusState private var isFocused: Bool
    var placeholder = "Search destination"
    
    var body: some View {
        VStack{
            TextField("", text: $name, onEditingChanged: { editingChanged in
                                    isActivated = editingChanged
            }, onCommit: {})
            .background(Color.gray)
            .disableAutocorrection(true)
            .textInputAutocapitalization(.never)
            .keyboardType(.asciiCapable)
            .onChange(of: text, perform: { _ in })
            .focused($isFocused)
//            .onChange(of: isFocused) { isFocused in
//                print("\(isFocused)")
//
//                isActivated = isFocused
//            }
            .onChange(of: isActivated){ _ in
                print("\(isActivated)")
            }
            Button(action: {
                text = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(Color.gray.opacity(0.6))
            }
            Button(action: {
                isFocused = false
                isActivated = false
            }) {
                Text("Cancel").foregroundColor(.green)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var searchText = ""
        @State var isActivated = false
        ContentView(text: $searchText, isActivated: $isActivated)
    }
}
