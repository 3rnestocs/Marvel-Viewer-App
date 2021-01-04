//
//  DetailVCMethods.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/28/20.
//

import UIKit

extension DetailViewController {
    
    //MARK: - ComicDetailView push
    func showComicDetails(withComic comic: Comics) {

        let comicDetailVC = ComicDetailViewController()
        comicDetailVC.comic = comic
        self.navigationController?.pushViewController(comicDetailVC,
                                                      animated: true)
    }
    
    func setUpCharactersData() {
        
        guard let character = character,
              let name = character.name,
              let description = character.descript,
              let urls = character.urls,
              let wiki = urls[1].url,
              let comics = character.comics,
              let comicUrl = comics.collectionUrl,
              let thumbnailUrl = character.thumbnail?.path,
              let ext = character.thumbnail?.extension
        else { return }
        
        fetchComics(comicUrl: comicUrl)
        
        let noDescriptionMsg = "This character doesn't have a description. You can get updated information in this link:  "
        
        let plainAttributedString = NSMutableAttributedString(string: noDescriptionMsg, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16)])
        let linkString = "Wiki"
        let attributedLinkString = NSMutableAttributedString(
            string: linkString,
            attributes: [NSAttributedString.Key.link: URL(string: wiki)!,
                        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 18)]
        )
        let fullAttributedString = NSMutableAttributedString()
        fullAttributedString.append(plainAttributedString)
        fullAttributedString.append(attributedLinkString)
        
        bioTextView!.isUserInteractionEnabled = true
        bioTextView!.isEditable = false
        
        nameLabel!.text = name
        if description == "" {
            bioTextView!.attributedText = fullAttributedString
            bioTextView!.linkTextAttributes = [NSAttributedString.Key.foregroundColor : Colors.mainRed!]
        } else {
            bioTextView!.text = description
        }
        
        DispatchQueue.main.async { [self] in
            characterImage?.kf.indicatorType = .activity
            characterImage?.kf.setImage(with: URL(string: thumbnailUrl+".\(ext)"))
        }
        
        if comics.items?.count == 0 {
            commonViews.displayErrorLabel(parentView: view, top: comicTitleContainerView!, containerView: comicContainerView!)
            commonViews.commonLabel.text = "This character doesn't have available comics"
        } else {
            configureComicCollection()
        }
    }
}
