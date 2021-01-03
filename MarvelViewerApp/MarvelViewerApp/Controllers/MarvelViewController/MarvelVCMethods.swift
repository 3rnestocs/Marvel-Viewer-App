//
//  MarvelVCMethods.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 12/28/20.
//

import UIKit

extension MarvelCollection {
    
    //MARK: - Push to DetailVC
    func showDetailView(withCharacter character: Characters) {

        let detailVC = DetailViewController()
        detailVC.character  = character
        self.navigationController?.pushViewController(detailVC,
                                                      animated: true)
    }
    
    //MARK: - SearchBar setup
    func configureSearchBar(showSearch: Bool) {
        
        searchBar.tintColor = Colors.mainRed
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([.foregroundColor : Colors.mainRed!], for: .normal)
        
        ///  This disables the Search button when InfoView show's up. It turns on again when that view is dismissed.
        if showSearch {
            searchBar = UISearchBar()
            searchBar.showsCancelButton = true
            searchBar.backgroundColor   = Colors.mainGray
            searchBar.placeholder   = "Find your favorite character"
            searchBar.delegate      = self
            navigationItem.leftBarButtonItem = nil
            searchBar.sizeToFit()
            searchBar.becomeFirstResponder()
            
            ///  This hides the search button when it's clicked, and the Search bar appears
            navigationItem.rightBarButtonItem = nil
            navigationItem.titleView          = searchBar
        } else {
            navigationItem.titleView = nil
            inSearchMode             = false
            configureSearchBarButton()
            collViewHeroes?.reloadData()
        }
    }
}
