//
//  BaseClass.swift
//
//  Created by APPLE  on 08/02/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct BaseClass: Codable {

  enum CodingKeys: String, CodingKey {
    case status
    case totalResults
    case articles
  }

  var status: String?
  var totalResults: Int?
  var articles: [Articles]?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    status = try container.decodeIfPresent(String.self, forKey: .status)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    articles = try container.decodeIfPresent([Articles].self, forKey: .articles)
  }

}
