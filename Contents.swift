//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

let headers = [
    "cache-control": "no-cache",
    "postman-token": "a44b9e8a-c6a9-a440-0294-ff77465fd3fb"
]

var request = NSMutableURLRequest(URL: NSURL(string: "https://raw.githubusercontent.com/PaulWoodIII/json-store/master/filled.json")!,
                                  cachePolicy: .UseProtocolCachePolicy,
                                  timeoutInterval: 10.0)
request.HTTPMethod = "GET"
request.allHTTPHeaderFields = headers

let session = NSURLSession.sharedSession()
let dataTask = session.dataTaskWithRequest(request, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error)
    } else {
        
        let httpResponse = response as? NSHTTPURLResponse
        let jsonObj = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
        print(jsonObj["name"]);
    }
})

dataTask.resume()
XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
