//
//  DestinationCard.swift
//  TravelAssist
//
//  Created by Johnny1 on 7/9/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import Combine
import SwiftUI

struct DestinationCard: View {
    @State var isBookmarked: Bool = false
//    @ObservedObject var destination: Destination

    var iso2: String
    var name: String
    var onBookmarkChanged: ((Bool) -> Void)?

    init(iso2: String, name: String, onBookmarkChanged: ((Bool) -> Void)?) {
        self.iso2 = iso2
        self.name = name
        self.onBookmarkChanged = onBookmarkChanged
    }

    var body: some View {
        infoView
            .background(backgroundView)

            .frame( height: 140)
            .clipped()
    }

    var infoView: some View {
        VStack {
            HStack {
                Spacer()
                bookmarkView
            }
            Spacer()
            Text(name)
                .foregroundColor(.green)
                .font(.system(size: 20))
        }
    }

    var bookmarkView: some View {
        VStack {
            Button(action: {
                isBookmarked.toggle()
                guard let action = onBookmarkChanged else { return }
                action(isBookmarked)
            }) {
                Image("bookmark.fill")
                    .renderingMode(.template)
                    .foregroundColor(isBookmarked ? Color.orange : .clear)
                    .overlay {
                        Image("bookmark")
                            .renderingMode(.template)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    .frame(width: 20, height: 20)
            }
        }
    }

    var backgroundView: some View {
        OptionalCachedImageView(optionalCachedImage: OptionalCachedImage(iso2: iso2))
            
            .frame(height: 140)
            .cornerRadius(9)
    }
}
