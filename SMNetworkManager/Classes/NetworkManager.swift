
import Alamofire
import UIKit

public extension UIViewController {
    
    /// Makes all requests
    /// - Parameters:
    ///   - url: `URL to fetch`
    ///   - method: `type of HTTP Method`
    ///   - parameterEncoding: `URL Encoding`
    ///   - request: `Codable object`
    ///   - responseType: `Codable object`
    ///   - completionHandler: returns response as `codable` object
    func fetch<REQ: Codable, RES: Codable>(url: String, method: HTTPMethod = .get,parameterEncoding: URLEncoding = .default, request: REQ, responseType: RES.Type, completionHandler: @escaping (_ responseModel: RES) -> ()) {
        let header: HTTPHeaders = SMNetworkManager.headers
        let params: [String: Any] = SMNetworkManager.encodeToDictionary(from: request)
        
        Alamofire.request(url, method: method, parameters: params, encoding: parameterEncoding, headers: header).validate(statusCode: 200 ..< 300).responseData { data in
            switch data.result {
            case .success(let data):
                if let model = data.decodeTo(model: RES.self) {
                    completionHandler(model)
                }
            case .failure(let error):
                self.mainQueue {
                    self.errorAlert(title: nil, description: error.localizedDescription, alertType: .promtWithReportToDeveloper(action1TItle: "OK", action2Title: "Report", completion: {
                        print("Hey there")
                    }))
                }
            }
        }
    }
    
    // MARK: Custom Alertview
    
    enum alertActions {
        case promt(actionTitle: String)
        case promtWithReportToDeveloper(action1TItle: String, action2Title: String, completion: () -> ())
    }
    
    func errorAlert(title: String?, description: String, alertType: alertActions) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        switch alertType {
        case .promt(let actionTitle):
            let defaultAction = UIAlertAction(title: actionTitle, style: .default, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            alert.addAction(defaultAction)
        case .promtWithReportToDeveloper(let actionTitle1, let action2Title, let completion):
            let defaultAction = UIAlertAction(title: actionTitle1, style: .default, handler: { _ in
                alert.dismiss(animated: true, completion: nil)
            })
            let reportToDevelperaction = UIAlertAction(title: action2Title, style: .default, handler: { _ in
                completion()
            })
            alert.addAction(defaultAction)
            alert.addAction(reportToDevelperaction)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: Queues
    
    func backgroundQueue(completionHandler: @escaping () -> ()) {
        DispatchQueue.global(qos: .background).async {
            completionHandler()
        }
    }
    
    func mainQueue(completionHandler: @escaping () -> ()) {
        DispatchQueue.main.async {
            completionHandler()
        }
    }
    
    // MARK: Top View controller
    
    var topViewController: UIViewController? {
        guard var topViewController = UIApplication.shared.keyWindow?.rootViewController else { return nil }
        while let presentedViewController = topViewController.presentedViewController {
            topViewController = presentedViewController
        }
        return topViewController
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
