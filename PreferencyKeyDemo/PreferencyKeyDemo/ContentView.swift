//
//  ContentView.swift
//  PreferencyKeyDemo
//
//  Created by Johnny Zhou on 1/11/2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    var body: some View {
        ScrollView{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
        .background(
            GeometryReader{ proxy in
                Color.clear.preference(
                    key: MinValueKey.self, value: proxy.frame(in:.global)
                    
                )
            }
            )
    }
}
public struct MinValueKey: PreferenceKey {
    public static var defaultValue: CGRect = .zero
    public static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}
final class CommonStore: ObservableObject {
    @Published var isScrolling = false
    private var timestamp = Date()

    let preferencePublisher = PassthroughSubject<Int, Never>()
    let timeoutPublisher = PassthroughSubject<Int, Never>()

    private var publisher: some Publisher {
        preferencePublisher
            .dropFirst(2) // 改善进入视图时可能出现的状态抖动
            .handleEvents(
                receiveOutput: { _ in
                    self.timestamp = Date()
                    // 如果 0.15 秒后没有继续收到位置变化的信号，则发送滚动状态停止的信号
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        if Date().timeIntervalSince(self.timestamp) > 0.1 {
                            self.timeoutPublisher.send(0)
                        }
                    }
                }
            )
            .merge(with: timeoutPublisher)
    }

    var cancellable: AnyCancellable?

    init() {
        cancellable = publisher
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in }, receiveValue: { output in
                guard let value = output as? Int else { return }
                if value == 1,!self.isScrolling {
                    self.isScrolling = true
                }
                if value == 0, self.isScrolling {
                    self.isScrolling = false
                }
            })
    }
}
#Preview {
    ContentView()
}
