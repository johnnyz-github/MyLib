//
//  ContentView.swift
//  Test
//
//  Created by Michal Ziobro on 03/04/2020.
//  Copyright © 2020 click5 Interactive. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

//
//  FlowStack.swift
//  CRM
//
//  Created by Michal Ziobro on 03/04/2020.
//  Copyright © 2020 Click 5 Interactive. All rights reserved.
//

import SwiftUI

@available(iOS 13, OSX 10.5, tvOS 13, watchOS 6, *)
public struct FlowStack<Data, ID, Content>: View where Data: RandomAccessCollection, Content: View, ID: Hashable {
    
    private let data: Data
    private let dataId: KeyPath<Data.Element, ID>
    private let content: (Data.Element) -> Content
    
    private let spacing: CGFloat
    
    @State private var loaded = false
    @State private var alignmentGuides = [AnyHashable: CGPoint]() {
           didSet { loaded = !oldValue.isEmpty }
    }
    @State private var totalHeight : CGFloat? = nil {
        didSet {
            loaded = (oldValue != nil)
        }
    }
    
    @State private var availableWidth: CGFloat? = nil {
        didSet {
            loaded = (oldValue != nil)
        }
    }
    
    let geometry: GeometryProxy?
    
    public var body: some View {
       
        
        Group {
            if geometry != nil {
                self.flow(in: geometry!)
                .background(Color.yellow)
                .frame(height: self.totalHeight)
            } else {
                GeometryReader { geometry in
                    self.flow(in: geometry)
                }
                .background(Color.red)
                .frame(width: self.availableWidth, height: self.totalHeight)
            }
        }
    }
    
    private func flow(in geometry: GeometryProxy) -> some View {
        
        print("Card geometry: \(geometry.size.width) \(geometry.size.height)")
        
        return ZStack(alignment: .topLeading) {
            //Color.clear
            ForEach(data, id: self.dataId) { element in
                self.content(element)
                    .geometryPreference(tag: element[keyPath: self.dataId])
                    /*
                    .alignmentGuide(.leading) { d in
                        print("Element: w: \(d.width), h: \(d.height)")
                        if (abs(width - d.width) > geometry.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        
                        let result = width
                        
                        if element[keyPath: self.dataId] == self.data.last![keyPath: self.dataId] {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    }
                    .alignmentGuide(.top) { d in
                        let result = height
                        if element[keyPath: self.dataId] == self.data.last![keyPath: self.dataId] {
                            height = 0 // last item
                        }
                        return result
                    }*/
                    
                    .alignmentGuide(.top) { d in
                        self.alignmentGuides[element[keyPath: self.dataId]]?.y ?? 0
                    }
                    .alignmentGuide(.leading) { d in
                        self.alignmentGuides[element[keyPath: self.dataId]]?.x ?? 0
                    }
            }
        }
        .background(Color.pink)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        //.animation(self.loaded ? .linear(duration: 1) : nil)
        
        .onPreferenceChange(_GeometryPreferenceKey.self, perform: { preferences in
        
                DispatchQueue.main.async {
                    let (alignmentGuides, totalHeight) = self.calculateAlignmentGuides(preferences: preferences, geometry: geometry)
                    self.alignmentGuides = alignmentGuides
                    self.totalHeight = totalHeight
                    self.availableWidth = geometry.size.width
                }
        })
    }
    
    func calculateAlignmentGuides(preferences: [_GeometryPreference], geometry: GeometryProxy) -> ([AnyHashable: CGPoint], CGFloat) {
        
        var alignmentGuides = [AnyHashable: CGPoint]()
        
        var width: CGFloat = 0
        var height: CGFloat = 0
        
        var rowHeights: Set<CGFloat> = []

        preferences.forEach { preference in
            let elementWidth = spacing + preference.rect.width
            
            if width + elementWidth >= geometry.size.width {
                width = 0
                height += (rowHeights.max() ?? 0) + spacing
                //rowHeights.removeAll()
            }
            
            let offset = CGPoint(x: 0 - width, y: 0 - height)
            
            print("Alignment guides offset: \(offset)")
            alignmentGuides[preference.tag] = offset
            
            width += elementWidth
            rowHeights.insert(preference.rect.height)
        }

        return (alignmentGuides, height + (rowHeights.max() ?? 0))
    }
}

// MARK: - Initializers
extension FlowStack {
    
    public init(spacing: CGFloat = 8, geometry: GeometryProxy? = nil, _ data: Data, id: KeyPath<Data.Element, ID>, content: @escaping (Data.Element) -> Content) {
        self.spacing = spacing
        self.data = data
        self.dataId = id
        self.content = content
        
        self.geometry = geometry
    }
}
extension FlowStack where ID == Data.Element.ID, Data.Element : Identifiable {
    
    public init(spacing: CGFloat = 8, _ data: Data, content: @escaping (Data.Element) -> Content) {
        self.spacing = spacing
        self.data = data
        self.dataId = \Data.Element.id
        self.content = content
        
        self.geometry = nil
    }
    
    public init(spacing: CGFloat = 8, @ViewBuilder content: @escaping () -> ForEach<Data, Data.Element.ID, Content>) {
        
        self.spacing = spacing
        self.data = content().data
        self.dataId = \Data.Element.id
        self.content = content().content

        self.geometry = nil
    }
}


struct FlowStack_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        let users = [
            UserDTO(id: "1", firstName: "Michal", lastName: "Ziobro"),
            UserDTO(id: "2", firstName: "Iwona", lastName: "Woj"),
            UserDTO(id: "3", firstName: "Pawel", lastName: "B"),
            UserDTO(id: "4", firstName: "Krzysztof", lastName: "M"),
            UserDTO(id: "5", firstName: "Anna", lastName: "Tas"),
            UserDTO(id: "6", firstName: "SDdk", lastName: "DDks"),
            UserDTO(id: "7", firstName: "Pawel", lastName: "Mas"),
            UserDTO(id: "8", firstName: "Kuba", lastName: "Mi"),
            UserDTO(id: "9", firstName: "Anna", lastName: "Tas"),
            UserDTO(id: "10", firstName: "SDdk", lastName: "DDks"),
        ]
        
        return VStack {
            Spacer()
            Text("Test")
            GeometryReader { geometry in
            FlowStack(spacing: 16, geometry: geometry, users, id: \.id) { user in
            
           // ForEach(users) { user in
               ZStack {
                    Circle()
                        .foregroundColor(Color.white)
                        .frame(width: 36, height: 36)
                    Text("\(user.fullName)")
                        .font(.system(size: 15))
                        .foregroundColor(Color.black)
               }.background(Color.green)
            }
        //}
        //.frame(width: 300, height: 200)
            }
            Spacer()
            Text("Test")
        }
    }
    
}

struct UserDTO: Identifiable {
    let id : String
    let firstName, lastName : String
    
    var initials: String {
        String(self.firstName.first ?? Character(" "))
            + String(self.lastName.first ?? Character(" "))
    }
    var fullName : String{
        firstName + " " + lastName
    }
}


//
//  _GeometryPreference.swift
//  CRM
//
//  Created by Michal Ziobro on 03/04/2020.
//  Copyright © 2020 Click 5 Interactive. All rights reserved.
//

import SwiftUI

// MARK: - Geometry Preference
// used to bubble up subview geometry rectangle

struct _GeometryPreference : Equatable {
    let tag: AnyHashable
    let rect: CGRect
    
    static func == (lhs: _GeometryPreference, rhs: _GeometryPreference) -> Bool {
        lhs.tag == rhs.tag
    }
}

struct _GeometryPreferenceKey: PreferenceKey {
    
    typealias Value = [_GeometryPreference]
    
    static var defaultValue: [_GeometryPreference] = []
    
    static func reduce(value: inout [_GeometryPreference], nextValue: () -> [_GeometryPreference]) {
        value.append(contentsOf: nextValue())
    }
}

struct _GeometryPreferenceSetter<ID: Hashable> : View {
    let tag: ID
    let coordinateSpace: CoordinateSpace
    
    var body: some View {
        GeometryReader { geometry in
            Rectangle().fill(Color.clear)
                .preference(key: _GeometryPreferenceKey.self,
                            value: [_GeometryPreference(tag: self.tag, rect: geometry.frame(in: self.coordinateSpace) )])
            
        }
    }
}

extension View {
    
    func geometryPreference<ID: Hashable>(tag: ID, coordinateSpace: CoordinateSpace = .global) -> some View {
        self.background(_GeometryPreferenceSetter(tag: tag, coordinateSpace: coordinateSpace))
    }
}

extension View {
    
    func onGeometryChange<ID: Hashable>(tag: ID, completion: @escaping (CGRect) -> Void) -> some View {
        
        self.onPreferenceChange(_GeometryPreferenceKey.self) { preferences in
            guard let pref = preferences.first(where: { ($0.tag as! ID) == tag }) else { return }
            completion(pref.rect)
        }
    }
}
