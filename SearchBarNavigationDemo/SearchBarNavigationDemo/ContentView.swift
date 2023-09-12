//
//  ContentView.swift
//  SearchBarNavigationDemo
//
//  Created by Johnny1 on 7/9/2023.
//

import SwiftUI

struct ContentView: View {
    let popularDestinations = [
        CountrySearch(iso2: "ID", name: "Indonesia", lat: -0.7893, lon: 113.9213),
        CountrySearch(iso2: "NZ", name: "NewZeland", lat: -40.9006, lon: 174.8860),
        CountrySearch(iso2: "JP", name: "Japan", lat: 36.2048, lon: 138.2529),
        CountrySearch(iso2: "US", name: "United States", lat: 37.0902, lon: 95.7129),
        CountrySearch(iso2: "UK", name: "United Kingdom", lat: 55.3781, lon: 3.4360),
        CountrySearch(iso2: "SG", name: "Singapore", lat: 1.3521, lon: 103.8198),
        CountrySearch(iso2: "AU", name: "Australia", lat: -25.2744, lon: 133.7751),
        CountrySearch(iso2: "TH", name: "Thailand", lat: 15.8700, lon: 100.9925),
        CountrySearch(iso2: "IT", name: "Italy", lat: 41.8719, lon: 12.5674),
        CountrySearch(iso2: "FR", name: "France", lat: 46.2276, lon: 2.2137)
    ]
    var body: some View {
//        VStack {
//            ScrollView {
                List {
//                    Section(header: Text("Latest Travel Advice").font(.largeTitle)) {
//                        ForEach(uniqueDestinations, id: \.self) { destination in
//                            DestinationCard(iso2: destination.iso2 , name: destination.name) { isbookMarked in
////                                if !isbookMarked {
////                                    destination.delete { parsedObject in }
//        //                                popularDestinations.first{ $0.iso2 == destination.iso2}?.setBookMark(false)
////                                }
//                            }
//                            .listRowInsets(EdgeInsets())
//                            .padding(.horizontal)
//                            .padding(.vertical, 6)
//                            .listRowSeparator(.hidden)
//                            .listRowBackground(Color.white)
//                        }
////                        .onDelete(perform: deleteItem)
//                    }
                    Section(header: Text("Popular Destinations").font(.largeTitle)) {
                        ForEach(popularDestinations, id: \.self) { destination in
                            DestinationCard(iso2: destination.iso2, name: destination.name) { isbookMarked in
                                if isbookMarked {
                                }
                            }
                            .listRowInsets(EdgeInsets())
                            .padding(.horizontal)
                            .padding(.vertical, 6)
                            .listRowSeparator(.hidden)
                            .listRowBackground(Color.white)
                        }
                    }
                }
                .listStyle(PlainListStyle())
//        }
    }
    var uniqueDestinations = [CountrySearch]()
    var popularDestination: [CountrySearch] {
        [
            CountrySearch(iso2: "ID", name: "Indonesia", lat: -0.7893, lon: 113.9213),
            CountrySearch(iso2: "NZ", name: "NewZeland", lat: -40.9006, lon: 174.8860),
            CountrySearch(iso2: "JP", name: "Japan", lat: 36.2048, lon: 138.2529),
            CountrySearch(iso2: "US", name: "United States", lat: 37.0902, lon: -95.7129),
            CountrySearch(iso2: "UK", name: "United Kingdom", lat: 55.3781, lon: 3.4360),
            CountrySearch(iso2: "SG", name: "Singapore", lat: 1.3521, lon: 103.8198),
            CountrySearch(iso2: "AU", name: "Australia", lat: -25.2744, lon: 133.7751),
            CountrySearch(iso2: "TH", name: "Thailand", lat: 15.8700, lon: 100.9925),
            CountrySearch(iso2: "IT", name: "Italy", lat: 41.8719, lon: 12.5674),
            CountrySearch(iso2: "FR", name: "France", lat: 46.2276, lon: 2.2137)
        ]
    }
}
struct CountrySearch: Hashable {
    var iso2: String
    var name: String
    var lat: Double?
    var lon: Double?
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
