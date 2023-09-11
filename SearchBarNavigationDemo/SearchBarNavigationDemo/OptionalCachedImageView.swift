//
//  OptionalCachedImage.swift
//  TravelAssist
//
//  Created by Johnny1 on 9/9/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import SwiftUI

struct OptionalCachedImageView: View {
    @ObservedObject var optionalCachedImage: OptionalCachedImage

    let defaultImage = "default_destination"
    var body: some View {
        VStack {
                Image("\(optionalCachedImage.iso2)-small")
                    .resizable()
                    .scaledToFill()
                    
//                    .frame(height: 140)
                    .clipped()
//            if optionalCachedImage.imageFetchStatus == .fetching {
//                ProgressView().scaleEffect(2)
//            } else if let uiImage = optionalCachedImage.uiImage {
//                Image(uiImage: uiImage)
//                    .resizable()
//                    .scaledToFill()
//                    .clipped()
//            } else if optionalCachedImage.imageFetchStatus == .failed {
//                Image(defaultImage)
//                    .resizable()
//                    .scaledToFill()
//                    .clipped()
//            }
        }
    }
}
