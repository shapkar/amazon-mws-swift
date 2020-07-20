//
//  MWSEndpoint.swift
//  amazon-mws
//
//  Created by Naum Shapkarovski on 6/5/20.
//  Copyright © 2020 Naum Shapkarovski. All rights reserved.
//

import Foundation

struct Endpoint {
    let URI: String = "mws.amazonservices.com"
    let SERVICE_PATH = "/Products/2011-10-01";
    let queryItems: [URLQueryItem]
}
