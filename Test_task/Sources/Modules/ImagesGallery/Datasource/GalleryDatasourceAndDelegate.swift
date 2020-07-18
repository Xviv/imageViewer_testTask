//
//  GalleryDatasourceAndDelegate.swift
//  Test_task
//
//  Created by Dan on 18.07.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

//MARK: - Datasource

class GalleryDatasourceAndDelegate: NSObject, UICollectionViewDataSource {
    
    var imageUrls: [URL] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! GalleryCollectionCell
        cell.configure(with: imageUrls, indexPath: indexPath)
        return cell
    }
    
    
}

//MARK: - Delegate

extension GalleryDatasourceAndDelegate: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
}
