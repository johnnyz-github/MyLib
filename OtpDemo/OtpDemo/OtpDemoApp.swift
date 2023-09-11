//
//  OtpDemoApp.swift
//  OtpDemo
//
//  Created by Johnny1 on 1/6/2023.
//

import SwiftUI

@main
struct OtpDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(phoneViewModel: PhoneViewModel())
        }
    }
}
