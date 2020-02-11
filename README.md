# SMNetworkManager

[![Version](https://img.shields.io/cocoapods/v/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)
[![License](https://img.shields.io/cocoapods/l/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)
[![Platform](https://img.shields.io/cocoapods/p/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)

SMNetworkManager was build on the top of [Alamofire](https://github.com/Alamofire/Alamofire) to handle API calls easily. By `SMNetworkManager` allows to send request and get reponse as `codable` models. 

#### Highlights
- Send request as `Codable`
- Get response as `Codable model`
- Custom error dialoges for bad requests
- Native JSON encoding and decoding procress.

## Installation

SMNetworkManager is available through [CocoaPods](https://cocoapods.org/pods/SMNetworkManager). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SMNetworkManager'
```

### Headers
 ```swift
//setting headers for network calls
SMNetworkManager.headers = [:]
```
### Usage
```swift
let request = RequestModel() ///Codable

//In viewController
self.fetch(url: "https://someAPI", request: request, responseType: ResponseModel.self, paramEncoding: .default) { [weak self] (response) in
       print(response)
  })
```
#### Modified request

> HTTP Method
```swift
 method:HTTPMethod //default = .get
```` 
> URL Encoding
```swift
urlEncoding:URLEncoding //default = .default
```
Example:
```swift
self.fetch(url: API, method: .post, request: requestModel(), responseType: ReponseModel.self, paramEncoding: .httpBody) { (responseModel) in
   print(responseModel)
  }
```
#### Response as String

⚙️ In Development

## Author

🙍🏻‍♂️ Suresh Mopidevi

## License

SMNetworkManager is available under the MIT license. See the LICENSE file for more info.
