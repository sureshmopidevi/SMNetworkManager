
import Alamofire
import UIKit

public extension UIViewController {
    func fetch<REQ: Codable, RES: Codable>(url: String, method: HTTPMethod = .get, request: REQ, responseType: RES.Type, paramEncoding: URLEncoding = .default, completionHandler: @escaping (_ responseModel: RES, _ responseString: String) -> ()) {
        let header: HTTPHeaders = SMNetworkManager.headers
        let params: [String: Any] = SMNetworkManager.encodeToDictionary(from: request)

        Alamofire.request(url, method: method, parameters: params, encoding: paramEncoding, headers: header).validate(statusCode: 200 ..< 300).responseData { data in
            DispatchQueue.main.async {
                switch data.result {
                case .success(let data):
                    if let model = data.decodeTo(model: RES.self) {
                        completionHandler(model, "")
                    }
                case .failure(let error):
                    let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    self.present(alert, animated: true, completion: nil)
                    debugPrint(error.localizedDescription)
                }
            }
        }
    }

    func backgroundQueue(completionHandler: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            completionHandler()
        }
    }
}


public extension Data {
    func decodeTo<T: Codable>(model: T.Type) -> T? {
        var decodedData: T?
        do {
            let decoded = try JSONDecoder().decode(T.self, from: self)
            decodedData = decoded
        } catch {
            debugPrint("🌐 SMNetworkManager: Error while decoding data: ~", error.localizedDescription)
        }

        return decodedData
    }
}

public extension UIViewController {
    var topViewController: UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
    }
}
