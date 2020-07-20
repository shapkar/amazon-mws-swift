//
//  QueryItems.swift
//  amazon-mws
//
//  Created by Naum Shapkarovski on 6/5/20.
//  Copyright © 2020 Naum Shapkarovski. All rights reserved.
//

import Foundation

extension Endpoint {
    static func getMatchingProductForId(isbns: [String]) -> Endpoint {
        let date = Signature.dateToIso8601()
        
        var queryItems: [URLQueryItem] = []
        for (index, element) in isbns.enumerated() {
            queryItems.append(URLQueryItem(name: "IdList.Id.\(index + 1)", value: element))
        }
        
        queryItems.append(URLQueryItem(name: "AWSAccessKeyId", value: Signature.urlEncode(urlItem: MWSClient.accessKey)))
        queryItems.append(URLQueryItem(name: "Action", value: GetMatchingProductForId.action))
        queryItems.append(URLQueryItem(name: "IdType", value: GetMatchingProductForId.idType))
        queryItems.append(URLQueryItem(name: "MWSAuthToken", value: Signature.urlEncode(urlItem: MWSClient.mwsAuthToken)))
        queryItems.append(URLQueryItem(name: "MarketplaceId", value: Signature.urlEncode(urlItem: MWSClient.marketplaceId)))
        queryItems.append(URLQueryItem(name: "SellerId", value: Signature.urlEncode(urlItem: MWSClient.sellerId)))
        queryItems.append(URLQueryItem(name: "SignatureMethod", value: Signature.urlEncode(urlItem: MWSClient.signatureMethod)))
        queryItems.append(URLQueryItem(name: "SignatureVersion", value: Signature.urlEncode(urlItem: "2")))
        queryItems.append(URLQueryItem(name: "Timestamp", value: Signature.urlEncode(urlItem: date)))
        queryItems.append(URLQueryItem(name: "Version", value: Signature.urlEncode(urlItem: "2011-10-01")))
        
        return Endpoint(queryItems: queryItems)
    }
    
}
