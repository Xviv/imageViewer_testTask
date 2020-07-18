//
//  ImagesGalleryPresenter.swift
//  Test_task
//
//  Created by Dan on 18.07.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import Foundation

protocol ImagesGalleryPresenterProtocol: class {
    init(view: ImagesGalleryControllerProtocol)
    
    func viewDidLoad()
}

class ImagesGalleryPresenter {
    
    //MARK: Properties
    private weak var view: ImagesGalleryControllerProtocol!
    
    required init(view: ImagesGalleryControllerProtocol) {
        self.view = view
    }
    
    private func getImageUrls(completionHandler: ((_ urls: [URL]) -> Void)?) {
        var imagesUrls: [URL] = []
        DispatchQueue.global(qos: .background).async {
            for i in 0..<20 {
                guard let url = URL(string: "https://picsum.photos/1920/1080?random=\(i)") else { return }
                imagesUrls.append(url)
            }
            completionHandler?(imagesUrls)
        }
    }
}

//MARK: - Output

extension ImagesGalleryPresenter: ImagesGalleryPresenterProtocol {
    
    func viewDidLoad() {
        getImageUrls { [weak self] (urls) in
            self?.view.setupGallery(with: urls)
        }
    }
}
