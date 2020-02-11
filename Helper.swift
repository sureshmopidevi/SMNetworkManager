//
//  File.swift
//  SMNetworkManager
//
//  Created by APPLE  on 10/02/20.
//

import Foundation
import Alamofire

public class SMNetworkManager: NSObject {
    public static var headers: HTTPHeaders = [:]

    public static func encodeToDictionary<MODEL: Codable>(from model: MODEL) -> [String: Any] {
        var jsonDictionary: [String: Any] = [:]
        do {
            let jsonData = try JSONEncoder().encode(model)
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] {
                jsonDictionary = json
            } else {
                debugPrint("Unable to serialize data")
            }
        } catch {
            debugPrint("Unable to parse data,", error.localizedDescription)
        }
        return jsonDictionary
    }
}

