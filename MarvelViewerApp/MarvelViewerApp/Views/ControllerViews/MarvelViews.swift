//
//  ControllersView.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/24/20.
//

import UIKit

extension MarvelCollection {
    
    //MARK: - NavBar
    func configureNavigationBar() {
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Colors.mainRed
        navigationController?.navigationBar.tintColor = Colors.mainRed
        title = "MCU Collection"
        
        configureSearchBarButton()
    }
    
    //MARK: - SearchBarButton
    func configureSearchBarButton() {

        let searchBtn = UIButton(type: .system)
        searchBtn.setImage(UIImage(named:"search"), for: .normal)
        searchBtn.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        searchBtn.widthAnchor.constraint(equalToConstant: 24).isActive = true
        searchBtn.heightAnchor.constraint(equalToConstant: 24).isActive = true
        searchBtn.tintColor = Colors.mainGray
        
        let search = UIBarButtonItem(customView: searchBtn)
        navigationItem.setRightBarButton(search, animated: true)
    }
    
    //MARK: - CollectionView
    func setMarvelCollectionViews() {
        
        configureNavigationBar()
        
        commonViews.setCopyrightViews(parentView: view)
        
        /// Create the CollectionView and add it inside the mainView safely
        guard let collViewHeroes  = collViewHeroes else { return }
        view.addSubview(collViewHeroes)

        collViewHeroes.dataSource = self
        collViewHeroes.delegate   = self
        collViewHeroes.frame      = view.bounds
        
        let commonLogo = commonViews.logoImageView
        let commonCredits = commonViews.creditsLabel
        
        collViewHeroes.anchor(top: commonLogo.bottomAnchor, paddingTop: 20,
                              bottom: commonCredits.topAnchor, paddingBottom: 10,
                              left: view.leftAnchor, paddingLeft: 0,
                              right: view.rightAnchor, paddingRight: 0,
                              width: 0, height: 0)
    }
}
