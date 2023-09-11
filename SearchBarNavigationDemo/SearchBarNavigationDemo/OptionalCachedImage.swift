//
//  OptionalCachedImage.swift
//  TravelAssist
//
//  Created by Johnny1 on 10/9/2023.
//  Copyright © 2023 CoverMore. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class OptionalCachedImage: ObservableObject {
    @Published var uiImage: UIImage?
    @Published var imageFetchStatus = ImageFetchStatus.idle

    var iso2: String
    var destinationImageUrl: String {
        "https://trip-images-dev.travelassistbywtp.com/destinations/\(iso2)-small.jpg"
    }

    private var imageFetchCancellable: AnyCancellable?
    required init(iso2: String) {
        self.iso2 = iso2
        fetchImageDataIfNecessary()
    }

    private func fetchImageDataIfNecessary() {
        let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let destinationUrl = documentsUrl.appendingPathComponent("\(iso2).jpg")

        if FileManager().fileExists(atPath: destinationUrl.path) {
            do {
                let imageData = try Data(contentsOf: destinationUrl)
                uiImage = UIImage(data: imageData)
            } catch {
                print("Error loading image : \(error)")
            }

            return
        }
        let session = URLSession.shared
        guard let url = URL(string: destinationImageUrl) else { return }
        let publisher = session.dataTaskPublisher(for: url)
            .map { data, urlResponse in UIImage(data: data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
        imageFetchCancellable = publisher.sink { [weak self] image in

            self?.uiImage = image
            self?.imageFetchStatus = (image != nil) ? .idle : .failed
        }
    }
}

enum ImageFetchStatus: Equatable {
    case idle
    case fetching
    case failed
}
