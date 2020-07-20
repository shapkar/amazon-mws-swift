//
//  ViewController.swift
//  amazon-mws
//
//  Created by Naum Shapkarovski on 5/20/20.
//  Copyright © 2020 Naum Shapkarovski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getProducts()
    }

    func getProducts() {
        let productsEndpoint: Endpoint = Endpoint.getMatchingProductForId(isbns: ["013432076X"])
        let request = Request(endpoint: productsEndpoint)
        
        request.invoke { (result) in
            print(result)
        }
    }
}

