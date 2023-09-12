//
//  Destination.swift
//  chatGPTcode
//
//  Created by Johnny1 on 8/4/2023.
//


    import SwiftUI

import CoreData

    struct CountryList: View {
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(sortDescriptors: [NSSortDescriptor(keyPath: \Country.name, ascending: true)], animation: .default)
        private var countries: FetchedResults<Country>

        @State private var searchText = ""

        var body: some View {
            NavigationView {
                VStack {
                    SearchBar(text: $searchText, placeholder: "Please select a country")
                    List {
                        ForEach(filteredCountries()) { country in
                            NavigationLink(destination: CountryDetail(country: country)) {
                                CountryRow(country: country)
                            }
                        }
                    }
                    .listStyle(GroupedListStyle())
                }
                .navigationBarTitle(Text("Countries"))
                .navigationBarItems(trailing: Button(action: dismiss) {
                    Image(systemName: "xmark")
                })
            }
        }

        private func dismiss() {
            // Dismiss the view
        }

        private func filteredCountries() -> [Country] {
            let allCountries = Array(countries)
            if searchText.isEmpty {
                return allCountries
            } else {
                return allCountries.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
            }
        }
    }

    struct CountryRow: View {
        var country: Country
        
        var body: some View {
            HStack {
                Image(country.flag)
                    .resizable()
                    .frame(width: 30, height: 20)
                Text(country.name)
            }
        }
    }

    struct CountryDetail: View {
        var country: Country
        
        var body: some View {
            VStack {
                Image(country.flag)
                    .resizable()
                    .frame(width: 150, height: 100)
                Text(country.name)
            }
        }
    }

    struct SearchBar: View {
        @Binding var text: String
        var placeholder: String

        var body: some View {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField(placeholder, text: $text)
                    .onChange(of: text, perform: { _ in })
                if !text.isEmpty {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                }
            }
            .padding(.horizontal, 15)
            .frame(height: 40)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal)
            .padding(.top, 10)
            .padding(.bottom, 5)
        }
    }

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let code: String
    let flag: String
    var isSelected: Bool = false
    
    static func allCountries() -> [Country] {
        // Return a list of all countries with their names, codes, and flag image names
        // You can use a JSON file or an API to fetch this data
        return []
    }
}
