//
//  DetailVCDatasource.swift
//  MarvelViewer
//
//  Created by Ernesto Jose Contreras Lopez on 12/28/20.
//

import UIKit

extension DetailViewController: UICollectionViewDataSource,
                                UICollectionViewDelegate {
    
    //MARK: - CollectionView DataSource/Delegate
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return comics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ComicCell
    
        cell.comics = comics[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comic = comics[indexPath.item]
        
        showComicDetails(withComic: comic)
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
        
    //MARK: - CollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = comicCollectionView!.frame.width / 2 - 16
        return CGSize(width: size, height: size)
    }
}
