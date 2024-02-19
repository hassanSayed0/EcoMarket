//
//  Home4Factory.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import Foundation

enum Home4Type: Codable {
    case categories([CategoriesTheme4Model])
    case product([ProductsTheme4Model])
}

class Home4Factory {
    
    func createSection(section: Home4FactoryModel) -> any SectionsLayout {
        switch section.type {
        case .categories(let items ):
            return CategoriesTheme4Section(items: items)
        case .product(let items ):
            return ProductsTheme4Section(items: items)
        }
    }
}
