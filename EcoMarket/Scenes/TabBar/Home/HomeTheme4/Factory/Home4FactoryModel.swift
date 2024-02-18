//
//  Home4FactoryModel.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import Foundation

struct Home4FactoryModel: Codable {
    let type: Home4Type
    var categories: [CategoriesTheme4Model]?
    var product: [ProductsTheme4Model]?
}

extension Home4FactoryModel {
    static let mockData: [Home4FactoryModel] = [
        Home4FactoryModel(type: .categories, categories: CategoriesTheme4Model.mockData),
        Home4FactoryModel(type: .product, product: ProductsTheme4Model.mockData)
    ]
}
