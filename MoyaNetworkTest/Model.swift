//
//  Model.swift
//  MoyaNetworkTest
//
//  Created by OpenObject on 2023/02/13.
//

import Foundation

struct Todos: Codable {
  var userId: Int
  var id: Int
  var title: String
  var completed: Bool
}
