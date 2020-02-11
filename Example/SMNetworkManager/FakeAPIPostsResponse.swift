//
//  FakeAPIPostsResponse.swift
//
//  Created by Suresh on 11/02/20
//  Copyright (c) . All rights reserved.
//

import Foundation

struct FakeAPIPostsResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case userId
        case title
        case body
        case id
    }

    var userId: Int?
    var title: String?
    var body: String?
    var id: Int?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        userId = try container.decodeIfPresent(Int.self, forKey: .userId)
        title = try container.decodeIfPresent(String.self, forKey: .title)
        body = try container.decodeIfPresent(String.self, forKey: .body)
        id = try container.decodeIfPresent(Int.self, forKey: .id)
    }
}
