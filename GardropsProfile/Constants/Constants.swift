//
//  Constants.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

import Foundation

class Constants: NSObject {
    static let shared = Constants()
    let baseURL = "https://gardrops-case.netlify.app/.netlify/functions/api/profile"
    let profileDetailURL = "/details"
    let productURL = "/products/main"
    let favoriteURL = "/products/favorites"
}
