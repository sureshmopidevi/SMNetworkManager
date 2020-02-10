//
//  Source.swift
//
//  Created by APPLE  on 08/02/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Source: Codable {

  enum CodingKeys: String, CodingKey {
    case id
    case name
  }

  var id: String?
  var name: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    id = try container.decodeIfPresent(String.self, forKey: .id)
    name = try container.decodeIfPresent(String.self, forKey: .name)
  }

}
