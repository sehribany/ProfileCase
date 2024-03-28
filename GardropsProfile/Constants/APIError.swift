//
//  APIError.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidData
    case decodingFailed
}
