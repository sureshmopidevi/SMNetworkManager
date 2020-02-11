# SMNetworkManager

[![Version](https://img.shields.io/cocoapods/v/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)
[![License](https://img.shields.io/cocoapods/l/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)
[![Platform](https://img.shields.io/cocoapods/p/SMNetworkManager.svg?style=flat)](https://cocoapods.org/pods/SMNetworkManager)


## Usage
SMNetworkManager was build to make network calls easy with [Alamofire](https://github.com/Alamofire/Alamofire). 

#### Highlights
- send codable requests
- get response as model
- Error popups when failed to get desired response.

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

SMNetworkManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SMNetworkManager'
```

## Author

iosdevsureshmopidevi@gmail.com, iosdevsureshmopidevi@gmail.com

## License

SMNetworkManager is available under the MIT license. See the LICENSE file for more info.
