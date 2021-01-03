//
//  ComicDetailVCMethods.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 1/1/21.
//

import UIKit
import Kingfisher

extension ComicDetailViewController {
    
    func setUpComicData() {
              /// Fetched data, ready to assign
        guard let comic = comic,
              let title = comic.title,
              let thumbnail = comic.thumbnail?.path,
              let ext = comic.thumbnail?.extension,
              let creators = comic.creators,
              let creatorsNames = creators.items,
              let characters = comic.characters,
              let charNames = characters.items,
              let id = comic.id,
              /// Fields to fill with data
              let comicImage = comicImage,
              let bioTextView = bioTextView,
              let titleLabel = titleLabel
        else { return }
        
        DispatchQueue.main.async {
            comicImage.kf.setImage(with: URL(string: thumbnail+".\(ext)"))
        }
        
        titleLabel.text = title.capitalized
        
        if let bio = comic.descript as String? {
            bioTextView.text = bio.withoutHtmlTags
        } else {
            bioTextView.text = "This comic doesn't have an available description."
        }
        
        /// This is used to filter the creators and characters names involved on the comic, so they can be displayed as a String.
        var creatorsArray = [String]()
        var charactersArray = [String]()
        
        for member in creatorsNames {
            guard let name = member.name else { return }
            creatorsArray.append(name)
        }
        
        for char in charNames {
            guard let name = char.name else { return }
            charactersArray.append(name)
        }
        
        let fullCreators = creatorsArray.joined(separator: ", ")
        let fullCharacters = charactersArray.joined(separator: ", ")

        /// This function creates some styled labels, and assign the corresponding data to the labels inside the textContainerView 
        configureLabel(label: idLabel, title: "Comic ID", details: "\(id)")
        configureLabel(label: creatorsLabel, title: "Creators", details: fullCreators)
        configureLabel(label: charactersLabel, title: "Characters", details: fullCharacters)
    }
}
