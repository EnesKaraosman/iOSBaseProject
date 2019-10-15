//
//  NetworkExampleViewController.swift
//  BaseProject
//
//  Created by Enes Karaosman on 22.09.2019.
//  Copyright © 2019 Enes Karaosman. All rights reserved.
//

import UIKit
import ObjectMapper
import SnapKit

class NetworkViewController: UIViewController, ActivityIndicatorView {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemOrange
        activityIndicatorTest()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func activityIndicatorTest() {
        
        APIClient.instance.executeGET(endPoint: "articles", success: { (response) in
            let articles = Mapper<Article>().mapArray(JSONObject: response.arrayObject) ?? []
            print(articles.count)
        }, failure: { error in
            // TODO: Add alert ctrl util
        })
        
    }
    
}
