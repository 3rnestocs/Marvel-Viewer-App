//
//  Delegates.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 12/26/20.
//

import UIKit

extension MarvelCollection: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        ///  This checks if the user search something, and if it does, filters the characters
        ///  in the CollectionView by name
        if searchText == "" || searchBar.text == nil {
            inSearchMode = false
            collViewHeroes?.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            filteredCharacters = fullCharacters
                .filter({ $0.name?.range(of: searchText) != nil })
            collViewHeroes?.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        configureSearchBar(showSearch: false)
    }
}
