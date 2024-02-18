//
//  CategoriesTheme4Model.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import Foundation

struct CategoriesTheme4Model: Codable {
    let name: String
}

extension CategoriesTheme4Model {
    static let mockData: [CategoriesTheme4Model] = [
        .init(name: "Dresses"),
        .init(name: "Jackets"),
        .init(name: "Jeans"),
        .init(name: "Shoese")
    ]
}
