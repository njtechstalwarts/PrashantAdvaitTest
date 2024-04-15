//
//  Constants.swift
//  MP Papers
//
//  Created by techstalwarts on 30/11/23.
//

import Foundation
import SwiftUI
import UIKit

func DLog(message: Any?, function: String = #function) {
#if DEBUG
    print("\(function): \(message ?? "")")
#endif
}

enum AppConstants: String {
    case appName = "PhotoListApp"
    case baseUrl = "api.unsplash.com"
    case scheme = "https"
    case port = ""
    case clientId = "<#Please add your client key here#>"
}

enum ApiNames: String {
    // MARK: Login Api
    case getPhotos = "/photos"
}

struct Device {
    static let isIpad             = UIDevice.current.userInterfaceIdiom == .pad
    static let isIphone           = UIDevice.current.userInterfaceIdiom == .phone
    static let isRetina           = UIScreen.main.scale >= 2.0
    
    static let screenWidth        = UIScreen.main.bounds.width
    static let screenHeight       = UIScreen.main.bounds.height
    static let acreenMaxLength    = Int( max(screenWidth, screenHeight) )
    static let screenBound        = UIScreen.main.bounds
}
