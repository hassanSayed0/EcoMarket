//
//  Home4Factory.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import Foundation

enum Home4Type: Codable {
    case categories
    case product
}


class Home4Factory {
    
    func createSection(section: Home4FactoryModel) -> any SectionsLayout {
        switch section.type {

            case .categories:
                return CategoriesTheme4Section(items: CategoriesTheme4Model.mockData)
            case .product:
                return ProductsTheme4Section(items: ProductsTheme4Model.mockData)
        }
    }
}
