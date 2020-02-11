# SMNetworkManager

[![Version](https://img.shields.io/cocoapods/v/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)
[![License](https://img.shields.io/cocoapods/l/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)
[![Platform](https://img.shields.io/cocoapods/p/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)


## Usage
SMNetworkManager was build the top of [Alamofire](https://github.com/Alamofire/Alamofire) to Handle API calls easily. By SMNetworkManager you can send and get reponse as codable models. 

#### Highlights
- Send request as `Codable`
- Get response as `Codable model`
- Custom error dialoges for bad requests
- Native JSON encoding and decoding procress.

and adding more..

### Headers
 ```swift
//setting headers for network calls
SMNetworkManager.headers = [:]
```
### Basic example
```swift
let request = RequestModel() ///Codable

//In viewController
self.fetch(url: "https://someAPI", request: request, responseType: ResponseModel.self, paramEncoding: .default) { [weak self] (response) in
       print(response)
  })
```

## Installation

SMNetworkManager is available through [CocoaPods](https://cocoapods.org/SMNetworkManager). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SMNetworkManager'
```

## Author

iosdevsureshmopidevi@gmail.com, iosdevsureshmopidevi@gmail.com

## License

SMNetworkManager is available under the MIT license. See the LICENSE file for more info.
