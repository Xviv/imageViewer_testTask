//
//  ImagesDatasource.swift
//  Test_task
//
//  Created by Dan on 18.07.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

class ImagesDatasource:ImageDataSource {
    
    private(set) var imageItems:[ImageItem]
    
    init(imageItems: [ImageItem]) {
        self.imageItems = imageItems
    }
    
    func numberOfImages() -> Int {
        return imageItems.count
    }
    
    func imageItem(at index: Int) -> ImageItem {
        return imageItems[index]
    }
}
