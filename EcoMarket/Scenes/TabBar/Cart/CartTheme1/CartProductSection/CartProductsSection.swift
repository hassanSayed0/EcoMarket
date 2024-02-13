//
//  CartProductsSection.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 31/01/2024.
//

import UIKit

/// A section layout for displaying products in a cart.
class CartProductsSection: SectionsLayout {
    typealias ItemsType = CartModel
    
    var items: [CartModel] = []
    
    /// Initializes the CartProductsSection with the provided items.
        ///
        /// - Parameter items: The array of products to be displayed in the section.
    init(items: [ItemsType]) {
        self.items = items
    }
    
    /// Provides the layout for the section.
       ///
       /// - Parameters:
       ///   - collectionView: The collection view displaying the section.
       ///   - layoutEnvironment: The environment describing the layout of the collection view.
       /// - Returns: An NSCollectionLayoutSection representing the layout of the section.
    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection {
        
        var configurations = UICollectionLayoutListConfiguration(appearance: .plain)
        configurations.backgroundColor = .clear
        configurations.showsSeparators = false
        
        configurations.trailingSwipeActionsConfigurationProvider = { [weak self] indexPath in 
            self?.trailingSwipeActionConfiguration(collectionView, at: indexPath)
        }
        
        let header = createHeader()
        let section = NSCollectionLayoutSection.list(using: configurations, layoutEnvironment: layoutEnvironment)
        section.boundarySupplementaryItems = [header]
        section.contentInsets = .init(top: 0, leading: 24, bottom: 40, trailing: 24)
        
        return section
    }
    
    private func trailingSwipeActionConfiguration(
        _ collectionView: UICollectionView,
        at indexPath: IndexPath
    ) -> UISwipeActionsConfiguration {
        
        let actionHandler: UIContextualAction.Handler = { [weak self] _, _, completion in
            self?.trailingSwipeAction(collectionView, at: indexPath)
            completion(true)
        }
        
        let action = UIContextualAction(style: .normal, title: nil, handler: actionHandler)
        action.image = AppImage.Icon.productDelete
        action.backgroundColor = AppColor.primaryButton
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
    private func trailingSwipeAction(_ collectionView: UICollectionView, at indexPath: IndexPath) {
        let item = items[indexPath.row]
        items.removeAll { $0 == item }
        collectionView.deleteItems(at: [indexPath])
    }
    
    /// Returns the number of items in the section.
    func numberOfItems() -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CartProductCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        cell.setup(product: CartModel.products[indexPath.row])
        cell.layoutIfNeeded()
        collectionView.layoutIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                           withReuseIdentifier: Header.identifier,
                                                                           for: indexPath) as? Header else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle("My Cart")
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(CartProductCollectionViewCell.self)
    }
    
    private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                heightDimension: .estimated(50))
        let header = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerSize,
            elementKind: Header.elementKind,
            alignment: .top
        )
        
        header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        return header
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(Header.self,
                                forSupplementaryViewOfKind: Header.elementKind,
                                withReuseIdentifier: Header.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}
