//
//  ReqClass.swift
//
//  Created by APPLE  on 08/02/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct ReqClass: Codable {

  enum CodingKeys: String, CodingKey {
    case category
    case page
    case country
    case pageSize
  }

  var category: String?
  var page: String?
  var country: String?
  var pageSize: String?

    init() {
        
    }


  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    category = try container.decodeIfPresent(String.self, forKey: .category)
    page = try container.decodeIfPresent(String.self, forKey: .page)
    country = try container.decodeIfPresent(String.self, forKey: .country)
    pageSize = try container.decodeIfPresent(String.self, forKey: .pageSize)
  }

}
