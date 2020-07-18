//
//  ModuleBuilder.swift
//  Test_task
//
//  Created by Dan on 18.07.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

protocol ModuleBuilderProtocol {
    static func createImageGalleryModule() -> UIViewController
}

class ModuleBuilder: ModuleBuilderProtocol {
    static func createImageGalleryModule() -> UIViewController {
        let controller = ImagesGalleryController()
        let presenter = ImagesGalleryPresenter(view: controller)
        controller.presenter = presenter
        return controller
    }
}
