//
//  DetailViews.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/28/20.
//

import Foundation

extension DetailViewController {
    
    //MARK: - General Views
    func configureDetailViews() {
        
        /// Safely adding all the components of the Detail View
        guard let imgViewLogo = imgViewLogo,
              let headerSectionView = headerSectionView,
              let characterImage = characterImage,
              let nameContainerView = nameContainerView,
              let bioContainerView = bioContainerView,
              let bioTitleContainerView = bioTitleContainerView,
              let bioTitleLabel = bioTitleLabel,
              let bioTextView = bioTextView,
              let comicContainerView = comicContainerView,
              let comicTitleContainerView = comicTitleContainerView,
              let comicTitleLabel = comicTitleLabel
        else { return }
        
        guard let comicCollectionView = comicCollectionView else { return }

        comicCollectionView.dataSource = self
        comicCollectionView.delegate   = self
        comicCollectionView.frame      = comicContainerView.bounds
        
        /// Adding all the needed subviews and setting up all the visual stuff
        view.backgroundColor = Colors.mainBlack
        navigationController?.navigationBar.tintColor = .white
        
        view.addSubview(imgViewLogo)
        view.addSubview(headerSectionView)
        headerSectionView.addSubview(characterImage)
        headerSectionView.addSubview(nameContainerView)
        
        view.addSubview(bioContainerView)
        bioContainerView.addSubview(bioTitleContainerView)
        bioContainerView.addSubview(bioTitleLabel)
        bioContainerView.addSubview(bioTextView)
        
        view.addSubview(comicContainerView)
        comicContainerView.addSubview(comicTitleContainerView)
        comicTitleContainerView.addSubview(comicTitleLabel)
        
        /// General layout of all the stored properties of the DetailVC
        imgViewLogo.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 5, bottom: nil,
                           paddingBottom: 0, left: nil, paddingLeft: 0, right: nil,
                           paddingRight: 0, width: 100, height: 50)
        imgViewLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        headerSectionView.anchor(top: imgViewLogo.bottomAnchor, paddingTop: 5, bottom: nil,
                                 paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0,
                                 right: view.rightAnchor, paddingRight: 0,
                                 width: 0, height: 250)
        
        characterImage.anchor(top: headerSectionView.topAnchor, paddingTop: 0,
                              bottom: headerSectionView.bottomAnchor, paddingBottom: 0,
                              left: headerSectionView.leftAnchor, paddingLeft: 0,
                              right: headerSectionView.rightAnchor, paddingRight: 0,
                              width: 0, height: 0)
        
        nameContainerView.anchor(top: nil, paddingTop: 0, bottom: headerSectionView.bottomAnchor,
                                 paddingBottom: 0, left: headerSectionView.leftAnchor, paddingLeft: 0,
                                 right: headerSectionView.rightAnchor, paddingRight: 0,
                                 width: 0,
                                 height: 70)
        
        bioContainerView.anchor(top: headerSectionView.bottomAnchor, paddingTop: 0, bottom: nil,
                                 paddingBottom: 0, left: view.leftAnchor, paddingLeft: 0,
                                 right: view.rightAnchor, paddingRight: 0,
                                 width: 0, height: 170)
        
        bioTitleContainerView.anchor(top: bioContainerView.topAnchor, paddingTop: 0, bottom: nil,
                                 paddingBottom: 0, left: bioContainerView.leftAnchor, paddingLeft: 0,
                                 right: bioContainerView.rightAnchor, paddingRight: 0,
                                 width: 0, height: 40)
        
        bioTitleLabel.anchor(top: bioTitleContainerView.topAnchor, paddingTop: 8, bottom: nil,
                        paddingBottom: 0, left: bioTitleContainerView.leftAnchor, paddingLeft: 20,
                        right: bioTitleContainerView.rightAnchor, paddingRight: 0,
                        width: 0, height: 0)
        
        bioTextView.anchor(top: bioTitleContainerView.bottomAnchor, paddingTop: 10, bottom: bioContainerView.bottomAnchor,
                        paddingBottom: 10, left: bioContainerView.leftAnchor, paddingLeft: 20,
                        right: bioContainerView.rightAnchor, paddingRight: 20,
                        width: 0, height: 0)
        
        comicContainerView.anchor(top: bioContainerView.bottomAnchor, paddingTop: 0,
                                  bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0,
                                  left: view.leftAnchor, paddingLeft: 0, right: view.rightAnchor,
                                  paddingRight: 0, width: 0, height: 0)
        
        comicTitleContainerView.anchor(top: comicContainerView.topAnchor, paddingTop: 0, bottom: nil,
                                 paddingBottom: 0, left: comicContainerView.leftAnchor, paddingLeft: 0,
                                 right: comicContainerView.rightAnchor, paddingRight: 0,
                                 width: 0, height: 40)
        
        comicTitleLabel.anchor(top: comicTitleContainerView.topAnchor, paddingTop: 8, bottom: nil,
                        paddingBottom: 0, left: comicTitleContainerView.leftAnchor, paddingLeft: 20,
                        right: comicTitleContainerView.rightAnchor, paddingRight: 0,
                        width: 0, height: 0)
        
        comicCollectionView.anchor(top: comicTitleContainerView.bottomAnchor, paddingTop: 10,
                                   bottom: comicContainerView.bottomAnchor, paddingBottom: 10,
                                   left: comicContainerView.leftAnchor, paddingLeft: 6,
                                   right: comicContainerView.rightAnchor, paddingRight: 12,
                                   width: 0, height: 0)
    }
}
