//
//  ViewController.swift
//  Test_task
//
//  Created by Dan on 18.07.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

protocol ImagesGalleryControllerProtocol: class {
    func setupGallery(with urls: [URL])
}

class ImagesGalleryController: UIViewController {
    
    var presenter: ImagesGalleryPresenterProtocol!
    
    private var datsourceAndDelegate = GalleryDatasourceAndDelegate()
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        presenter.viewDidLoad()
        
    }
    
    //MARK: - UI Setup
    
    private func setupUI() {
        view.addSubview(collectionView)
        
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    //MARK: - Views
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let size = self.view.frame.width / 3
        layout.itemSize = CGSize(width: size, height: size)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.register(GalleryCollectionCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self.datsourceAndDelegate
        collectionView.delegate = self.datsourceAndDelegate
        return collectionView
    }()


}

//MARK: - Output

extension ImagesGalleryController: ImagesGalleryControllerProtocol {
    func setupGallery(with urls: [URL]) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.datsourceAndDelegate.imageUrls = urls
            self.collectionView.reloadData()
        }
    }
}
