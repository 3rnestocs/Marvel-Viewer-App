//
//  ControllerCalls.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/24/20.
//

import Foundation

extension MarvelCollection {
    
    func fetchMarvelCharacters() {
        
//        service.getCharacters(shouldPage: false) { [self] (charList) in
//
//            if !charList.isEmpty {
//
//                firstCharacters = charList
//                fullCharacters += firstCharacters
//                print("---Got all Heroes and Villains correctly. Ready to load more---")
//
//                DispatchQueue.main.async {
//                    collViewHeroes?.reloadData()
//                }
//            }
//        }
    }
    
    func fetchMoreCharacters(indexPath: IndexPath) {
        
//        if indexPath.item == fullCharacters.count - 1  {
//            service.getCharacters(shouldPage: true) { [self] (moreChars) in
//
//                moreCharacters = moreChars
//                fullCharacters += moreCharacters
//
//                DispatchQueue.main.async {
//                    collViewHeroes?.reloadData()
//                }
//            }
//        }
    }
}

//extension DetailViewController {
//    
//    func fetchComics(comicUrl: String) {
//        
//        service.getComics(resourceUrl: comicUrl) { [self] (result) in
//            switch result {
//            case .success(let comicList):
//                comics += comicList
//                DispatchQueue.main.async {
//                    comicCollectionView?.reloadData()
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//        
//    }
//    
//}
