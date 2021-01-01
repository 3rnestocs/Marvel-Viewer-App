//
//  ControllersView.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/24/20.
//

import UIKit

// MARK: - MarvelColletion views
extension MarvelCollection {
    
    func configureNavigationBar() {
        
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = Colors.mainRed
        navigationController?.navigationBar.tintColor = Colors.mainRed
        title = "MCU Collection"
        
        configureSearchBarButton()
    }
    
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
    
    func setMarvelCollectionViews() {
        
        configureNavigationBar()
        
        commonViews.setCommonViews(parentView: view)
        
        /// Create the CollectionView and add it inside the mainView safely
        guard let collViewHeroes  = collViewHeroes else { return }
        view.addSubview(collViewHeroes)

        collViewHeroes.dataSource = self
        collViewHeroes.delegate   = self
        collViewHeroes.frame      = view.bounds
        
        collViewHeroes.anchor(top: nil, paddingTop: 0, bottom: view.safeAreaLayoutGuide.bottomAnchor,
                        paddingBottom: 30, left: view.leftAnchor, paddingLeft: 0,
                        right: view.rightAnchor, paddingRight: 0, width: 0, height: view.frame.height/1.68)
    }
}
