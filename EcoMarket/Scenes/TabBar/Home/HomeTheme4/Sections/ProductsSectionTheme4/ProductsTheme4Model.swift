//
//  ProductTheme4Model.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import Foundation
struct ProductsTheme4Model: Codable {
    
    // MARK: - Properties
    let name: String
    let brand: String
    let price: String
    let image: String
}

extension ProductsTheme4Model {
    static var mockData: [ProductsTheme4Model] = [
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "products/image 90-2"),
         .init(name: "Giselle Top in White Linen", brand: "Madewell", price: "$108.00", image: "products/image 90-3"),
         .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$96.00", image: "products/image 90-4"),
         .init(name: "Irregular Rib Skirt", brand: "Madewell", price: "$78.00", image: "products/image 90"),
         .init(name: "Bubble Elastic T-shirt", brand: "Roller Rabbit", price: "$39.00", image: "products/image"),
         .init(name: "Vado Odelle Dress", brand: "Madewell", price: "$98.00", image: "products/image")
    ]
}
