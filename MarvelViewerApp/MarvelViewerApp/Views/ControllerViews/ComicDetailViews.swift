//
//  ComocDetailViews.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 1/1/21.
//

import UIKit

extension ComicDetailViewController {
    
    //MARK: - General Views
    func setComicDetailViews() {
        
        view.backgroundColor = Colors.mainBlack
        commonViews.setCopyrightViews(parentView: view)
        commonViews.setCommonDesignViews(parentView: view)

        let sectionView = commonViews.commonSectionView
        
        sectionView.addSubview(comicImage!)
        comicImage!.anchor(top: nil, paddingTop: 0,
                          bottom: commonViews.commonSectionView.bottomAnchor, paddingBottom: 0,
                          left: nil, paddingLeft: 0,
                          right: nil, paddingRight: 0,
                          width: view.frame.width, height: view.frame.height/2.7)
              
        sectionView.addSubview(textContainerView)
        
        textContainerView.anchor(top: comicImage!.topAnchor, paddingTop: 0,
                                 bottom: comicImage!.bottomAnchor, paddingBottom: 0,
                                 left: comicImage!.leftAnchor, paddingLeft: 0,
                                 right: comicImage!.rightAnchor, paddingRight: 0,
                                 width: 0, height: 0)
        
        textContainerView.addSubview(titleLabel!)
        titleLabel!.anchor(top: nil, paddingTop: 0,
                           bottom: textContainerView.bottomAnchor, paddingBottom: 15,
                          left: comicImage!.leftAnchor, paddingLeft: 20,
                          right: comicImage!.rightAnchor, paddingRight: 20,
                          width: 0, height: 0)
        
        sectionView.addSubview(bioTextView!)
        bioTextView!.anchor(top: sectionView.topAnchor, paddingTop: 20,
                           bottom: textContainerView.topAnchor, paddingBottom: 20,
                           left: sectionView.leftAnchor, paddingLeft: 20,
                           right: sectionView.rightAnchor, paddingRight: 20,
                           width: 0, height: 0)
        
        textContainerView.addSubview(formatLabel)
        formatLabel.anchor(top: textContainerView.topAnchor, paddingTop: 30,
                           bottom: nil, paddingBottom: 0,
                           left: textContainerView.leftAnchor, paddingLeft: 20,
                           right: textContainerView.rightAnchor, paddingRight: 20,
                           width: 0, height: 0)
        
        textContainerView.addSubview(creatorsLabel)
        creatorsLabel.anchor(top: formatLabel.bottomAnchor, paddingTop: 10,
                             bottom: nil, paddingBottom: 0,
                             left: textContainerView.leftAnchor, paddingLeft: 20,
                             right: textContainerView.rightAnchor, paddingRight: 20,
                             width: 0, height: 0)
        
        textContainerView.addSubview(idLabel)
        idLabel.anchor(top: creatorsLabel.bottomAnchor, paddingTop: 10,
                       bottom: nil, paddingBottom: 0,
                       left: textContainerView.leftAnchor, paddingLeft: 20,
                       right: textContainerView.rightAnchor, paddingRight: 20,
                       width: 0, height: 0)
        
    }
    
    func configureLabel(label: UILabel, title: String, details: String) {
        
        var attributedText = NSMutableAttributedString()
        
        attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title):  ", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .heavy), NSAttributedString.Key.foregroundColor: Colors.mainRed!]))
        
        attributedText.append(NSAttributedString(string: "\(details)", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15), NSAttributedString.Key.foregroundColor: Colors.mainWhite!]))
        
            label.attributedText = attributedText
    }
}
