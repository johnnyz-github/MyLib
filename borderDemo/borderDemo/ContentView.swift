//
//  ContentView.swift
//  borderDemo
//
//  Created by Johnny1 on 6/12/2022.
//

import SwiftUI

struct ContentView: View {
    @State var isRiskRatingViewPresented = true
    var body: some View {
        RiskSeverityRatingView(isVisible: $isRiskRatingViewPresented)
    }
    struct RiskSeverityRatingView: View {
        @Binding var isVisible: Bool

        private let ratingsTitles: [String] = SeverityType.allCases.map { $0.title }
        private let ratingsColors: [Color] = SeverityType.allCases.map { $0.color }

        var body: some View {
            VStack(spacing: 0) {
                HStack {
                    Text("Alerts Severity Ratings")
                        .font(Font.custom("Roboto-Regular", size: 11))
                    Spacer()
                    Button {
                        isVisible = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.orange)
                    }
                }
                .padding(8)
                .frame(height: 30)
                .foregroundColor(.gray)
                .background(Color.yellow)

                VStack(alignment: .leading, spacing: 10) {
                    ForEach(0 ..< ratingsTitles.count) { index in
                        HStack(spacing: 16) {
                            RoundedRectangle(cornerRadius: 2).fill(ratingsColors[index]).frame(width: 60, height: 8)
                            Text(ratingsTitles[index])
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
                .foregroundColor(.black)
                .padding(16)
            }
            .cornerRadius(4)
            .scaledToFit()
            .frame(width: 280)
            .border(Color.green)
        }
    }

        enum SeverityType: String, CaseIterable {
            case unrated
            case low
            case medium
            case moderate
            case high
            case extreme

            var image: UIImage {
                switch self {
                case .unrated:
                    return #imageLiteral(resourceName: "mapPinUnrated")
                case .low:
                    return #imageLiteral(resourceName: "mapPinLow")
                case .medium:
                    return #imageLiteral(resourceName: "mapPinMedium")
                case .moderate:
                    return #imageLiteral(resourceName: "mapPinModerate")
                case .high:
                    return #imageLiteral(resourceName: "mapPinHigh")
                case .extreme:
                    return #imageLiteral(resourceName: "mapPinExtreme")
                }
            }

            var title: String {
                switch self {
                case .unrated:
                    return "Unrated Severity Alerts"
                case .low:
                    return "Low Severity Alerts"
                case .medium:
                    return "Medium Severity Alerts"
                case .moderate:
                    return "Moderate Severity Alerts"
                case .high:
                    return "High Severity Alerts"
                case .extreme:
                    return "Extreme Severity Alerts"
                }
            }

            var color: Color {
                switch self {
                case .unrated:
                    return Color.gray
                case .low:
                    return Color.green
                case .medium:
                    return Color.yellow
                case .moderate:
                    return Color.orange
                case .high:
                    return Color.pink
                case .extreme:
                    return Color.red
                }
            }

            // demo purpose
            static func generateRandom() -> SeverityType {
                allCases[Int.random(in: 0 ..< allCases.count)]
            }
        }

    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
