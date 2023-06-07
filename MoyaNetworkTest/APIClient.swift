//
//  APIClient.swift
//  MoyaNetworkTest
//
//  Created by OpenObject on 2023/02/13.
//

import Foundation
import Moya

enum APIClient {
  case users, todos, comments
}

extension APIClient: TargetType {
  var baseURL: URL {
    switch self {
    case .users, .todos, .comments:
      return URL(string: "https://jsonplaceholder.typicode.com/")!
    }
  }
  
  var path: String {
    switch self {
    case .users:
      return "users"
    case .todos:
      return "todos"
    case .comments:
      return "comments"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .users, .todos, .comments:
      return .get
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .users:
      return .requestPlain
    case .todos:
      return .requestPlain
    case .comments:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    return ["Content-type": "application/json"]
  }
  
  
}
