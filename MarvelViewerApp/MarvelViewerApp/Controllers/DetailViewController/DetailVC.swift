//
//  DetailViewController.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/27/20.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Properties
    var character: Characters?
    var comics = [Comics]()
    
    /// HEADER SECTION STUFF
    var imgViewLogo: UIImageView? = {
        
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    
    lazy var headerSectionView: UIView? = {
       let view = UIView()
        view.backgroundColor = Colors.mainRed
        return view
    }()
    
    lazy var nameContainerView: UIView? = {
       let view = UIView()
        view.backgroundColor = Colors.mainBlack
        view.alpha = 0.85
        view.addSubview(nameLabel!)
        nameLabel?.center(inView: view)
        return view
    }()
    
    var nameLabel: UILabel? = {
       let label = UILabel()
        label.text = "Testing text"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Colors.mainGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AmericanCaptain", size: 45)
        return label
    }()
    
    var characterImage: UIImageView? = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    /// CHARACTER DESCRIPTION SECTION
    lazy var bioContainerView: UIView? = {
       let view = UIView()
        view.backgroundColor = Colors.mainWhite
        return view
    }()
    
    lazy var bioTitleContainerView: UIView? = {
       let view = UIView()
        view.backgroundColor = Colors.mainRed
        return view
    }()
    
    var bioTitleLabel: UILabel? = {
       let label = UILabel()
        label.text = "Biography".uppercased()
        label.textColor = Colors.mainWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AmericanCaptain", size: 30)
        return label
    }()
    
    var bioTextView: UITextView? = {
       let textView = UITextView()
        textView.textColor = Colors.mainBlack
        textView.text = "Test with the biography"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var comicContainerView: UIView? = {
       let view = UIView()
        view.backgroundColor = Colors.mainWhite
        view.addSubview(comicCollectionView!)
        return view
    }()
    
    lazy var comicTitleContainerView: UIView? = {
       let view = UIView()
        view.backgroundColor = Colors.mainRed
        return view
    }()
    
    var comicTitleLabel: UILabel? = {
       let label = UILabel()
        label.text = "Comics".uppercased()
        label.textColor = Colors.mainWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AmericanCaptain", size: 30)
        return label
    }()
    
    var comicCollectionView: UICollectionView? = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        cv.register(ComicCell.self,
                    forCellWithReuseIdentifier: comicReuseIdentifier)
        cv.layer.cornerRadius = 12
        layout.scrollDirection = .horizontal
        cv.alwaysBounceHorizontal = true
        cv.backgroundColor = Colors.mainGray
        return cv
    }()
    
    //MARK: - Init code
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDetailViews()
        setUpCharactersData()   
    }
}
