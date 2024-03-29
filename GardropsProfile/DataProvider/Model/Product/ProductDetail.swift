//
//  ProductDetail.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

// MARK: - ProductDetail
public struct ProductDetail: Codable {
    let id          : String
    let image       : String
    let price, brand: String
}
