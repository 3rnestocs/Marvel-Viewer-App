//
//  CommonViews.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 1/1/21.
//

import UIKit

class CommonViews: UIViewController {
    
    //MARK: - Properties
    var logoImageView: UIImageView = {
        
        let logo = UIImageView()
        logo.image = UIImage(named: "logo")
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.contentMode = .scaleAspectFill
        return logo
    }()
    
    let creditsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = Colors.mainGray
        label.text = "Data provided by Marvel. © 2014 Marvel"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = Colors.mainRed
        label.textAlignment = .center
        return label
    }()
    
    var commonSectionView: UIView = {
       let view = UIView()
        view.backgroundColor = Colors.mainWhite
        return view
    }()
    
    var commonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AmericanCaptain", size: 45)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = Colors.mainBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    func setCopyrightViews(parentView: UIView) {
        
        //MARK: - Common Logo
        parentView.addSubview(logoImageView)
        
        logoImageView.anchor(top: parentView.safeAreaLayoutGuide.topAnchor, paddingTop: 20, bottom: nil,
                           paddingBottom: 0, left: parentView.leftAnchor, paddingLeft: 0,
                           right: parentView.rightAnchor, paddingRight: 0,
                           width: 0, height: view.frame.height/6)
        
        //MARK: - Common Credits
        parentView.addSubview(creditsLabel)
            
        creditsLabel.anchor(top: nil, paddingTop: 0, bottom: parentView.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: parentView.leftAnchor, paddingLeft: 0, right: parentView.rightAnchor, paddingRight: 0, width: 0, height: 20)
    }
    
    func setCommonDesignViews(parentView: UIView) {
        
        parentView.addSubview(commonSectionView)
        
        commonSectionView.anchor(top: logoImageView.bottomAnchor, paddingTop: 20,
                                 bottom: creditsLabel.topAnchor, paddingBottom: 20,
                                 left: parentView.leftAnchor, paddingLeft: 0,
                                 right: parentView.rightAnchor, paddingRight: 0,
                                 width: 0, height: 0)
    }
    
    func displayErrorLabel(parentView: UIView, top: UIView, containerView: UIView) {
        
        parentView.addSubview(commonLabel)
        
        commonLabel.anchor(top: top.bottomAnchor, paddingTop: 10,
                           bottom: containerView.bottomAnchor, paddingBottom: 10,
                           left: containerView.leftAnchor, paddingLeft: 30,
                           right: containerView.rightAnchor, paddingRight: 30,
                           width: 0, height: 0)
    }
}
