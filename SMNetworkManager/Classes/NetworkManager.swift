
import Alamofire
import UIKit

public extension UIViewController {
    func fetch<REQ: Codable, RES: Codable>(url: String, request: REQ, responseType: RES.Type, paramEncoding: URLEncoding = .default, completionHandler: @escaping (_ responseModel: RES) -> ()) {
        let header: HTTPHeaders = [:]
        let params: [String: Any] = encodeToDictionary(from: request)
        Alamofire.request(url, method: .get, parameters: params, encoding: paramEncoding, headers: header).validate(statusCode: 200 ..< 300).responseData { data in
            switch data.result {
            case .success(let data):
                if let model = data.decodeTo(model: RES.self) {
                    completionHandler(model)
                }
            case .failure(let error):
                let alert = UIAlertController.init(title: "Error", message: "", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)
                debugPrint(error.localizedDescription)
            }
        }
    }

     func encodeToDictionary<MODEL: Codable>(from model: MODEL) -> [String: Any] {
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


public extension Data {
    func decodeTo<T: Codable>(model: T.Type) -> T? {
        var decodedData: T?
        do {
            let decoded = try JSONDecoder().decode(T.self, from: self)
            decodedData = decoded
        } catch {
            print("Error while decoding data", error.localizedDescription)
        }

        return decodedData
    }
}

