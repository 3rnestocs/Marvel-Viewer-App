//
//  MarvelVCDatasource.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 12/28/20.
//

import UIKit

extension MarvelCollection: UICollectionViewDelegateFlowLayout {
        
    //MARK: - CollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let size = view.frame.width / 2 - 18
        return CGSize(width: size, height: size)
    }
}
    
extension MarvelCollection: UICollectionViewDataSource,
                            UICollectionViewDelegate {
    //MARK: - CollectionView DataSource/Delegate
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return inSearchMode ? filteredCharacters.count : fullCharacters.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterReuseIdentifier, for: indexPath) as! CharactersCell

        cell.characters = inSearchMode ? filteredCharacters[indexPath.item] : fullCharacters[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let character = inSearchMode ? filteredCharacters[indexPath.item] : fullCharacters[indexPath.item]
            showDetailView(withCharacter: character)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
        fetchMoreCharacters(indexPath: indexPath)
    }
    
    //MARK: - ReusableView config
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionHeader {
                 let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! CollectionViewHeader
                 return sectionHeader
            } else { //No footer in this case but can add option for that
                 return UICollectionReusableView()
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: (collViewHeroes?.frame.width)!, height: 70)
    }
}
