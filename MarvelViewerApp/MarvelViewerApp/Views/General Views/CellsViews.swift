//
//  CellsViews.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/28/20.
//

import Foundation

//MARK: - CharacterCell views
extension CharactersCell {
    
    func setCharacterCellViews() {
        
        layer.borderWidth   = 0.5
        layer.cornerRadius  = layer.frame.width / 8
        self.clipsToBounds  = true
        layer.borderColor   = Colors.mainBlack?.cgColor
        
        self.addSubview(firstImage)
        self.addSubview(firstLabel)
        
        firstImage.anchor(top: self.topAnchor, paddingTop: 0,
                          bottom: firstLabel.topAnchor, paddingBottom: 0,
                          left: self.leftAnchor, paddingLeft: 0,
                          right: self.rightAnchor, paddingRight: 0,
                          width: firstImage.frame.width, height: firstImage.frame.height)
        
        firstLabel.anchor(top: firstImage.bottomAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: 0, height: self.frame.height/6)
    }
}

////MARK: - ComicCell views
//extension ComicCell {
//    
//    func setComicViews() {
//        
//        layer.borderWidth   = 0.5
//        layer.cornerRadius  = layer.frame.width / 8
//        self.clipsToBounds  = true
//        layer.borderColor   = Colors.mainBlack?.cgColor
//        
//        self.addSubview(comicImage)
//        self.addSubview(comicLabel)
//        
//        comicImage.anchor(top: self.topAnchor, paddingTop: 0,
//                          bottom: comicLabel.topAnchor, paddingBottom: 0,
//                          left: self.leftAnchor, paddingLeft: 0,
//                          right: self.rightAnchor, paddingRight: 0,
//                          width: comicImage.frame.width, height: comicImage.frame.height)
//        
//        comicLabel.anchor(top: comicImage.bottomAnchor, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: 0, height: self.frame.height/5)   
//    }
//}
