//
//  ImageViewerTheme.swift
//  Test_task
//
//  Created by Dan on 18.07.2020.
//  Copyright © 2020 Daniil. All rights reserved.
//

import UIKit

public enum ImageViewerTheme {
    case light
    case dark
    
    var color:UIColor {
        switch self {
            case .light:
                return .white
            case .dark:
                return .black
        }
    }
    
    var tintColor:UIColor {
        switch self {
            case .light:
                return .black
            case .dark:
                return .white
        }
    }
}
