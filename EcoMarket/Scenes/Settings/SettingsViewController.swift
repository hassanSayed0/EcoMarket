//
//  SettingsCollectionViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 08/02/2024.
//

import UIKit

class SettingsViewController: UICollectionViewController {
    
    // MARK: - Properties
    //
    var sections: [any SectionsLayout] = []
    
    // MARK: - Initialization
    //
    let viewModel: SettingsViewModel
    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionViewSections()
        configureCollectionView()
        collectionView.reloadData()
    }
    
    // MARK: - UI Configuration
    
    /// Configures the collection view with necessary settings and registers cell classes.
    private func configureCollectionView() {
        sections.forEach { section in
            section.registerCell(in: self.collectionView)
            section.registerSupplementaryView(in: self.collectionView)
        }
        collectionView.backgroundColor = Asset.AppColor.backgroundColor.color
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    private func addCollectionViewSections() {
        self.sections.removeAll()
        self.sections.append(EditProfileSection())
        
        _ = viewModel.getSectionLayouts().map { self.sections.append($0) }
        
        self.sections.append(FooterSection())
    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
        }
        sections.forEach { section in
            section.registerDecorationView(layout: layout)
        }
        return layout
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, 
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, 
                                                   viewForSupplementaryElementOfKind: kind,
                                                   at: indexPath)
    }
}
