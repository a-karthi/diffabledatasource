//
//  ItemList.swift
//  diffables
//
//  Created by @karthi on 08/03/22.
//

import Foundation

class ItemList {
    
    static let shared = ItemList()
    
    public var iconSet: [Icon] = [  Icon(name: "candle", price: 390, isFeatured: false),
                                    Icon(name: "cat", price: 290, isFeatured: true),
                                    Icon(name: "dribbble", price: 190, isFeatured: false),
                                    Icon(name: "ghost", price: 499, isFeatured: false),
                                    Icon(name: "hat", price: 299, isFeatured: false),
                                    Icon(name: "owl", price: 300, isFeatured: true),
                                    Icon(name: "pot", price: 200, isFeatured: false),
                                    Icon(name: "pumkin", price: 90, isFeatured: false),
                                    Icon(name: "rip", price: 700, isFeatured: false),
                                    Icon(name: "skull", price: 890, isFeatured: false),
                                    Icon(name: "sky", price: 99, isFeatured: false),
                                    Icon(name: "toxic", price: 299, isFeatured: false),
                                    Icon(name: "ic_book", price: 400, isFeatured: false),
                                    Icon(name: "ic_backpack", price: 500, isFeatured: false),
                                    Icon(name: "ic_camera", price: 499, isFeatured: false),
                                    Icon(name: "ic_coffee", price: 200, isFeatured: true),
                                    Icon(name: "ic_glasses", price: 200, isFeatured: false),
                                    Icon(name: "ic_ice_cream", price: 100, isFeatured: false),
                                    Icon(name: "ic_smoking_pipe", price: 699, isFeatured: false),
                                    Icon(name: "ic_vespa", price:999, isFeatured: false)
                                  ]
    
}

struct Icon: Hashable {
    var name: String = ""
    var price: Double = 0.0
    var isFeatured: Bool = false
    
    init(name: String, price: Double, isFeatured: Bool) {
        self.name = name
        self.price = price
        self.isFeatured = isFeatured
    }
}
