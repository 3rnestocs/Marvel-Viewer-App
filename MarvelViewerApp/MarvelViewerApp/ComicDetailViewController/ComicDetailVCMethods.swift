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
        guard let comic = comic,
              let title = comic.title,
              let thumbnail = comic.thumbnail?.path,
              let ext = comic.thumbnail?.extension,
              let bio = comic.descript,
              let creators = comic.creators,
              let creatorsNames = creators.items,
              let format = comic.format,
              let id = comic.id,
              let comicImage = comicImage,
              let bioTextView = bioTextView,
              let titleLabel = titleLabel
        else { return }
        
        comicImage.kf.setImage(with: URL(string: thumbnail+".\(ext)"))
        titleLabel.text = title.capitalized
        comicImage.kf.indicatorType = .activity
        bioTextView.text = bio.withoutHtmlTags
        
        var names = [String]()
        
        for member in creatorsNames {
            guard let name = member.name else { return }
            names.append(name)
        }
        
        let goodNames = names.joined(separator: ", ")

        configureLabel(label: formatLabel, title: "Creators", details: goodNames)
        configureLabel(label: formatLabel, title: "Format", details: format)
        configureLabel(label: idLabel, title: "Comic ID", details: "\(id)")
        
    }
    
}
