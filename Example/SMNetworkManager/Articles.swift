//
//  Articles.swift
//
//  Created by APPLE  on 08/02/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct Articles: Codable {

  enum CodingKeys: String, CodingKey {
    case publishedAt
    case source
    case descriptionValue = "description"
    case title
    case content
    case urlToImage
    case author
    case url
  }

  var publishedAt: String?
  var source: Source?
  var descriptionValue: String?
  var title: String?
  var content: String?
  var urlToImage: String?
  var author: String?
  var url: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
    source = try container.decodeIfPresent(Source.self, forKey: .source)
    descriptionValue = try container.decodeIfPresent(String.self, forKey: .descriptionValue)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    content = try container.decodeIfPresent(String.self, forKey: .content)
    urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
    author = try container.decodeIfPresent(String.self, forKey: .author)
    url = try container.decodeIfPresent(String.self, forKey: .url)
  }

}
