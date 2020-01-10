//
//  GenericListViewModel.swift
//  BaseProject
//
//  Created by Enes Karaosman on 10.01.2020.
//  Copyright © 2020 Enes Karaosman. All rights reserved.
//

import Foundation

class GenericListViewModel: BaseViewModel {
    
    func getList(articles: @escaping (([Article]) -> Void)) {
        articles([
            Article(name: "Dr. Lessie Lesch", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/evanshajed/128.jpg"),
            Article(name: "Raina Douglas", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/digitalmaverick/128.jpg"),
            Article(name: "Rosetta Parker", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/overra/128.jpg"),
            Article(name: "Krista Williamson", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/thekevinjones/128.jpg"),
            Article(name: "Jovanny Crist", avatar: "https://s3.amazonaws.com/uifaces/faces/twitter/craigrcoles/128.jpg")
        ])
    }
    
}
