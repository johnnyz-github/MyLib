//
//  ButtonGroup.swift
//  Memorize
//
//  Created by JohnnyZ on 16/11/21.
//  Copyright © 2021 Tieda Wei. All rights reserved.
//

import Foundation
import SwiftUI

struct ButtonGroup : View{
    var buttonName : String
    init(_ buttonName : String){
        self.buttonName = buttonName
    }
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut) {
                //self.viewModel.resetGame()
            }
        }, label: {
            Text(buttonName)
        })
        }
    
    
}
