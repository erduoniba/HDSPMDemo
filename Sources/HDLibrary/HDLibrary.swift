import Alamofire

public struct HDLibrary {
    public private(set) var text = "Hello, World!"

    public init() {
    }
    
    public func printAFInfo() {
        AF.request("https://httpbin.org/get").response { response in
            print("HDLibrary")
            debugPrint(response)
        }
    }
}
