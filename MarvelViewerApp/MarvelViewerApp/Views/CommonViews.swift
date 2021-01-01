//
//  CommonViews.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 1/1/21.
//

import UIKit

class CommonViews: UIViewController {
    
    var imgViewLogo: UIImageView = {
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func setCommonViews(parentView: UIView) {
        
        //MARK: - Common Logo
        parentView.addSubview(imgViewLogo)
        
        imgViewLogo.anchor(top: parentView.safeAreaLayoutGuide.topAnchor, paddingTop: 28, bottom: nil,
                           paddingBottom: 0, left: parentView.leftAnchor, paddingLeft: 0,
                           right: parentView.rightAnchor, paddingRight: 0,
                           width: 0, height: view.frame.height/6)
        
        //MARK: - Common Credits
        parentView.addSubview(creditsLabel)
            
        creditsLabel.anchor(top: nil, paddingTop: 0, bottom: parentView.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0, left: parentView.leftAnchor, paddingLeft: 0, right: parentView.rightAnchor, paddingRight: 0, width: 0, height: 20)
    }
}
