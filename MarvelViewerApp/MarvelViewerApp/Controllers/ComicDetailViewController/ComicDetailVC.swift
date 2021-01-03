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
    
    var bioTextView: UITextView? = {
       let textView = UITextView()
        textView.textColor = Colors.mainBlack
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.backgroundColor = .clear
        textView.isUserInteractionEnabled = true
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    var comicImage: UIImageView? = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "logo")
        img.translatesAutoresizingMaskIntoConstraints = false
        img.clipsToBounds = true
        return img
    }()
    
    var textContainerView: UIView = {
       let view = UIView()
        view.backgroundColor = Colors.mainBlack
        view.alpha = 0.8
        return view
    }()
    
    var titleLabel: UILabel? = {
       let label = UILabel()
        label.text = "Testing text"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = Colors.mainGray
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "AmericanCaptain", size: 45)
        return label
    }()
    
    let creatorsLabel = UILabel()
    let charactersLabel = UILabel()
    let idLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setComicDetailViews()
        setUpComicData()
    }
}
