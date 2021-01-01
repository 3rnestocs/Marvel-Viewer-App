//
//  ComicDetailVC.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/30/20.
//

import UIKit

class ComicDetailViewController: UIViewController {

    var comic: Comics?
    let commonViews = CommonViews()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setComicDetailViews()
    }
}
