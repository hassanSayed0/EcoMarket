//
//  CategoriesTheme4Section.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import UIKit

class CategoriesTheme4Section: SectionsLayout {
    typealias ItemsType = CategoriesTheme4Model
    
    var items: [CategoriesTheme4Model] = []
    
    var isSelectedIndex: Int?
    
    init(items: [ItemsType]) {
        self.items = items
    }
    
    func numberOfItems() -> Int {
        items.count
    }
    
    func sectionLayout(
        _ collectionView: UICollectionView,
        layoutEnvironment: NSCollectionLayoutEnvironment
    ) -> NSCollectionLayoutSection {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(30))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 6
        section.contentInsets.bottom = 25
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell: CategoriesTheme4CollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Can't dequeue UserCollectionViewCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        let isSelected = indexPath.item == isSelectedIndex
        cell.setup(category: items[indexPath.row], isSelected: isSelected)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        isSelectedIndex = indexPath.item
        collectionView.reloadData()
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: CollectionSectionHeader.identifier,
            for: indexPath
        ) as? CollectionSectionHeader else {
            Logger.log("Failed to get header view", category: \.default, level: .fault)
            return UICollectionReusableView()
        }
        header.setTitle("Categories")
        return header
    }
    
    func registerCell(in collectionView: UICollectionView) {
        collectionView.registerNib(CategoriesTheme4CollectionViewCell.self)
    }
    
    func registerSupplementaryView(in collectionView: UICollectionView) {
        collectionView.register(CollectionSectionHeader.self,
                                forSupplementaryViewOfKind: CollectionSectionHeader.elementKind,
                                withReuseIdentifier: CollectionSectionHeader.identifier)
    }
    
    func registerDecorationView(layout: UICollectionViewLayout) {
        
    }
}
