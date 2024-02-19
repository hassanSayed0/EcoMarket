//
//  Home4FactoryModel.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import Foundation

struct Home4FactoryModel: Codable {
    
    static let mockData: [Home4Type] = [
         .categories(CategoriesTheme4Model.mockData),
         .product(ProductsTheme4Model.mockData)
    ]
}
