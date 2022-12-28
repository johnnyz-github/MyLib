//
//  URLType.swift
//  CircleGestureDemo
//
//  Created by Johnny1 on 28/12/2022.
//

import Foundation
enum URLType {
  case name(String)
  case url(URL)

  var url: URL? {
    switch self {
      case .name(let name):
        return Bundle.main.url(forResource: name, withExtension: "gif")
      case .url(let remoteURL):
        return remoteURL
    }
  }
}
