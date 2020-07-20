//
//  Request.swift
//  amazon-mws
//
//  Created by Naum Shapkarovski on 6/5/20.
//  Copyright © 2020 Naum Shapkarovski. All rights reserved.
//

import Foundation

struct Request {
    let httpMethod = "POST"
    let endpoint: Endpoint
    
    init(endpoint: Endpoint) {
        self.endpoint = endpoint
    }
    
    func invoke(completion: @escaping (String) -> Void){
        var request = URLRequest(url: endpoint.url!)
        request.httpMethod = httpMethod
        var output: String?
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            if let httpResponse = response as? HTTPURLResponse {
                print("response status", httpResponse.statusCode)
            }
            if ((error) != nil) {
                print("request error", error as Any)
            } else {
                output = String(data: data!, encoding: String.Encoding.utf8)!
                if let output = output {
                    completion(output)
                }
            }
        })
        
        task.resume()
    }
}
