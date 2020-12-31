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
    
    func showCreditsLabel(inView: UIView) {
        
        let creditsLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            label.textColor = Colors.mainGray
            label.text = "Data provided by Marvel. © 2014 Marvel"
            label.backgroundColor = Colors.mainRed
            label.textAlignment = .center
            return label
        }()
        
        inView.addSubview(creditsLabel)
        
        creditsLabel.anchor(top: nil, paddingTop: 0, bottom: inView.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: inView.leftAnchor, paddingLeft: 0, right: inView.rightAnchor, paddingRight: 0, width: 0, height: 20)
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
        
        /// Create the mainView and add it to the controller safely
        guard let viewMarvel = viewMarvel else { return }
        view.addSubview(viewMarvel)
        showCreditsLabel(inView: viewMarvel)
        
        /// Create the CollectionView and add it inside the mainView safely
        guard let collViewHeroes  = collViewHeroes else { return }
        viewMarvel.addSubview(collViewHeroes)

        collViewHeroes.dataSource = self
        collViewHeroes.delegate   = self
        collViewHeroes.frame      = viewMarvel.bounds
        
        /// Create the logo safely
        guard let imgViewLogo = imgViewLogo else { return }
        viewMarvel.addSubview(imgViewLogo)
        
        collViewHeroes.anchor(top: nil, paddingTop: 0, bottom: viewMarvel.safeAreaLayoutGuide.bottomAnchor,
                        paddingBottom: 30, left: viewMarvel.leftAnchor, paddingLeft: 0,
                        right: viewMarvel.rightAnchor, paddingRight: 0, width: 0, height: view.frame.height/1.68)

        viewMarvel.anchor(top: view.topAnchor, paddingTop: 0, bottom: view.bottomAnchor, paddingBottom: 0,
                        left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor, paddingRight: 0,
                        width: 0, height: 0)
        
        imgViewLogo.anchor(top: viewMarvel.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil,
                          paddingBottom: 0, left: viewMarvel.leftAnchor, paddingLeft: 0,
                          right: viewMarvel.rightAnchor, paddingRight: 0, width: 0, height: view.frame.height/6)
    }
}
