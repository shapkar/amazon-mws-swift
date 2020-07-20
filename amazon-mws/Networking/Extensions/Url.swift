//
//  Url.swift
//  amazon-mws
//
//  Created by Naum Shapkarovski on 6/5/20.
//  Copyright © 2020 Naum Shapkarovski. All rights reserved.
//

import Foundation

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = URI
        components.path = SERVICE_PATH
        components.queryItems = queryItems
        
        components.queryItems = components.queryItems?.sorted(by: { $0.name < $1.name })
        
        let stringToSign = "POST" + "\n" +
            String(components.host!) + "\n" +
            String(components.path) + "\n" +
            String(components.query!)
        
        print("String to Sign", stringToSign)
        
        let signature = Signature.calculateSignature(stringToSign: stringToSign, secretKey: MWSClient.secretKey)
        components.queryItems?.append(URLQueryItem(name: "Signature", value: signature))
        
        components.percentEncodedQuery = components.percentEncodedQuery?
            .replacingOccurrences(of: "+", with: "%2B").replacingOccurrences(of: "*", with: "%2A").replacingOccurrences(of: "%7E", with: "~").replacingOccurrences(of: "%25", with: "%")
        
        print("components url ", components.url! as Any)
        
        return components.url
    }
}
