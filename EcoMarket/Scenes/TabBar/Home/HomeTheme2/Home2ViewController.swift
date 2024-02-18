//
//  Home2ViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 15/02/2024.
//

import UIKit

class Home2ViewController: UIViewController {
    
    // MARK: - Properties
    //
    var sections: [any SectionsLayout] = []
    let homeFactory = HomeFactory()
    private var headerViewHeight: CGFloat = 0
    
    // MARK: - Outlets
    //
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!    
    @IBOutlet weak var headerStackViewHeightConstraints: NSLayoutConstraint!
    
    // MARK: - Lifecycle Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        headerViewHeight = headerStackViewHeightConstraints.constant
        
        let sections = HomeFactoryModel.mockData
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
        setupLabelsUI()
    }
    
    /// Configure buttons UI
    private func setupButtonsUI() {
        filterButton.setTitle("", for: .normal)
        filterButton.setImage(AppImage.HomeTheme2.filterButtonIcon, for: .normal)
    }
    
    /// Congiure Labels UI
    private func setupLabelsUI() {
        titleLabel.text = L10n.Home.Theme2.title
        titleLabel.font = .h1
        titleLabel.textColor = AppColor.primaryText
        
        subtitleLabel.text = L10n.Home.Theme2.subtitle
        subtitleLabel.font = .h3
        subtitleLabel.textColor = AppColor.socialButton
    }
    
    // MARK: - UI Configuration
    
    /// Configures the collection view with necessary settings and registers cell classes.
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
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
        }
    }
}

extension Home2ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateHeaderStackView(with: scrollView.contentOffset.y)
    }
    
    private func animateHeaderStackView(with offsetY: CGFloat) {
        if offsetY <= 0.0 {
            headerStackViewHeightConstraints.constant = 80
            if offsetY > -24.0 {
                titleLabel.font = .custom(size: 24 - (offsetY * 0.5), weight: .bold)
            }
            
        } else {
            if offsetY * 2 <= 24 {
                titleLabel.font = .custom(size: 24 - (offsetY * 0.5), weight: .bold)
            }
            headerStackViewHeightConstraints.constant = 80 - offsetY
        }
        self.view.layoutIfNeeded()
    }
}
