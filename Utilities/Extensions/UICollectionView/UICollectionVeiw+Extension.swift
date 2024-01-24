//
//  UICollectionVeiw+Extension.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit
protocol Identifiable { }

extension Identifiable {
    static var identifier: String { String(describing: Self.self) }
}

extension UICollectionReusableView: Identifiable { }

extension UICollectionView {
    func registerNib<Cell: UICollectionViewCell>(_ cell: Cell.Type) where Cell: Identifiable {
        self.register(UINib(nibName: Cell.identifier, bundle: nil),
                      forCellWithReuseIdentifier: Cell.identifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell? where Cell: Identifiable {
        return self.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell
    }
}

//
//extension UICollectionView {
//    func registerSupplementaryView(_ view: UICollectionReusableView.Type) {
//        register(UINib(nibName: view.identifier, bundle: nil),
//                 forSupplementaryViewOfKind: view.identifier,
//                 withReuseIdentifier: view.identifier)
//    }
//}
