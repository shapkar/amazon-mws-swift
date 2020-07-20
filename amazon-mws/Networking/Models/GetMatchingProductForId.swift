//
//  GetMatchingProductForId.swift
//  amazon-mws
//
//  Created by Naum Shapkarovski on 6/5/20.
//  Copyright © 2020 Naum Shapkarovski. All rights reserved.
//

import Foundation

struct GetMatchingProductForId {
    static let action = "GetMatchingProductForId";
    static let idType = "ISBN";
    
    var isbns: [String]
    
    init(isbns: [String]) {
        self.isbns = isbns
    }
}
