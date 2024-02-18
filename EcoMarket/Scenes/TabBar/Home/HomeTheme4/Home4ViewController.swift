//
//  Home4ViewController.swift
//  EcoMarket
//
//  Created by Hassan on 18/02/2024.
//

import UIKit

class Home4ViewController: UIViewController {
    
    // MARK: - Properties
    //
    var sections: [any SectionsLayout] = []
    let homeFactory = Home4Factory()
    
    // MARK: - Outlets
    //
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!
    
    // MARK: - Lifecycle Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sections = Home4FactoryModel.mockData
        sections.forEach { section in
            let sectionLayout = homeFactory.createSection(section: section)
            self.sections.append(sectionLayout)
        }
        configureCollectionView()
        collectionView.reloadData()
        configureUI()
        
    }
    
    // MARK: - Private Methods
    //
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundColor
        containerStackView.layoutMargins = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        setupButtonsUI()
    }
    
    private func setupButtonsUI() {

        filterButton.setTitle("", for: .normal)
        filterButton.setImage(AppImage.delete, for: .normal)
    }
    
    // MARK: - UI Configuration
    
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        sections.forEach { section in
            section.registerCell(in: self.collectionView)
            section.registerSupplementaryView(in: self.collectionView)
        }
        collectionView.backgroundColor = AppColor.backgroundColor
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout

    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
        }
    }
}

extension Home4ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
}
