//
//  ComicCell.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/28/20.
//

import UIKit

class ComicCell: UICollectionViewCell {
    
    //MARK: - Properties
    var comics: Comics? {
        didSet {
            guard let comic = comics,
                  let title = comic.title,
                  let thumbnail = comic.thumbnail?.path,
                  let creators = comic.creators,
                  let ext = comic.thumbnail?.extension,
                  let images = comic.images
            else { return }
            
            comicLabel.text = title.capitalized
            comicImage.kf.indicatorType = .activity
            
            if thumbnail != withoutImage && title == comics?.title && creators.items?.count != 0 {
                comicImage.kf.setImage(with: URL(string: thumbnail+".\(ext)"))
            } else {
                if images.count != 0 {
                    guard let img = images.first?.path,
                          let imgExt = images.first?.extension
                    else { return }
                    comicImage.kf.setImage(with: URL(string: img+".\(imgExt)"))
                } else {
                    comicImage.kf.setImage(with: URL(string: withoutImage + ".jpg"))
                }
            }
        }
    }
    
    let comicLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = Colors.mainBlack
        label.textColor = Colors.mainGray
        label.textAlignment = .center
        return label
    }()
    
    let comicImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "logo")
        return imageView
    }()
    
    // MARK: - Init stuff
    override init(frame: CGRect) {
        super.init(frame: frame)
        setComicViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
