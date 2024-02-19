//
//  Home4FactoryModel.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import Foundation

struct Home4FactoryModel: Codable {
    let type: Home4Type
}

extension Home4FactoryModel {
    static let mockData: [Home4FactoryModel] = [
        Home4FactoryModel(type: .categories(CategoriesTheme4Model.mockData)),
        Home4FactoryModel(type: .product(ProductsTheme4Model.mockData))
    ]
}
