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
    var searchBar = UISearchBar()
    var inSearchMode = false
    
    var viewMarvel: UIView? = {
        
        let view = UIView()
        view.backgroundColor = Colors.mainBlack
        return view
    }()
    
    var collViewHeroes: UICollectionView? = {

        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        cv.register(CharactersCell.self,
                    forCellWithReuseIdentifier: characterReuseIdentifier)
        cv.register(CollectionViewHeader.self,
                    forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                    withReuseIdentifier: "header")
        cv.backgroundColor = Colors.mainRed
        return cv
    }()
    
    var imgViewLogo: UIImageView? = {
        
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFill
        return logo
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

