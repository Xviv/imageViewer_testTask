//
//  GalleryCollectionCell.swift
//  Test_task
//
//  Created by Dan on 18.07.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryCollectionCell: UICollectionViewCell {
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Reuse
    
    override func prepareForReuse() {
        galleryImageView.sd_cancelCurrentImageLoad()
        galleryImageView.image = nil
    }
    
    //MARK: - Cell setup
    
    func configure(with urls: [URL], indexPath: IndexPath) {
        let url = urls[indexPath.item]
        galleryImageView.sd_setImage(with: url)
        galleryImageView.setupImageViewer(urls: urls, initialIndex: indexPath.item)
    }
    
    //MARK: - UI Setup
    
    private func setupUI() {
        addSubview(galleryImageView)
        
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(equalTo: topAnchor),
            galleryImageView.leftAnchor.constraint(equalTo: leftAnchor),
            galleryImageView.rightAnchor.constraint(equalTo: rightAnchor),
            galleryImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    //MARK: - Views
    
    let galleryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
}
