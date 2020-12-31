//
//  FirstSimpleCell.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 11/19/20.
//

import UIKit
import Kingfisher

class CharactersCell: UICollectionViewCell {
    
    // MARK: - Properties
    var characters: Characters? {
        didSet {
            guard let name  = characters?.name,
                  let thumbnailUrl = characters?.thumbnail?.path,
                  let ext = characters?.thumbnail?.extension else { return }

            if name == characters?.name {
                firstLabel.text = name.capitalized

                firstImage.kf.indicatorType = .activity
                firstImage.kf.setImage(with: URL(string: thumbnailUrl+".\(ext)"))

            } else {
                firstLabel.text = "Ernesto"
                firstImage.image = #imageLiteral(resourceName: "jose")
            }
        }
    }
    
    let firstLabel: UILabel = {
        let label = UILabel()
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.numberOfLines = 0
        label.backgroundColor = Colors.mainBlack
        label.textColor = Colors.mainGray
        label.textAlignment = .center
        return label
    }()
    
    let firstImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    // MARK: - Init stuff
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setCharacterCellViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class CollectionViewHeader: UICollectionReusableView {
    
    var collectionViewTitle: UIImageView? = {
        
        let image = UIImage(named: "characters")
        let logo = UIImageView(image: image)
        logo.contentMode = .scaleAspectFit
        logo.clipsToBounds = true
        logo.tintColor = Colors.mainWhite
        return logo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .none
        guard let collectionViewTitle = collectionViewTitle else { return }
        addSubview(collectionViewTitle)
        
        collectionViewTitle.anchor(top: self.topAnchor, paddingTop: 10, bottom: nil, paddingBottom: 0, left: self.leftAnchor, paddingLeft: 0, right: self.rightAnchor, paddingRight: 0, width: 0, height: 70)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
