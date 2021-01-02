//
//  ViewController.swift
//  MarvelViewerAppApp
//
//  Created by Ernesto Jose Contreras Lopez on 11/18/20.
//

import UIKit

class MarvelCollection: UIViewController {
    
    // MARK: - Properties
    var firstCharacters = [Characters]()
    var moreCharacters  = [Characters]()
    var fullCharacters  = [Characters]()
    
    var filteredCharacters = [Characters]()
    let commonViews = CommonViews()
    var searchBar = UISearchBar()
    var inSearchMode = false
    
    var collViewHeroes: UICollectionView? = {

        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        cv.register(CharactersCell.self,
                    forCellWithReuseIdentifier: reuseIdentifier)
        cv.register(CollectionViewHeader.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "header")
        cv.backgroundColor = Colors.mainRed
        return cv
    }()
    
    // MARK: - Selectors
    @objc func searchButtonClicked() {
        configureSearchBar(showSearch: true)
    }
    
    // MARK: - Init stuff
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMarvelCollectionViews()
        fetchMarvelCharacters()
    }
}

