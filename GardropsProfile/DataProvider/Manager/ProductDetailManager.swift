//
//  ProductDetailManager.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

import Foundation
import Alamofire

class ProductDetailManager{
    static let shared = ProductDetailManager()
    private lazy var baseURL: String = Constants.shared.baseURL
    let contentProductURL: String = Constants.shared.productURL
    let contentFavoriteURL: String = Constants.shared.favoriteURL
    var page = 0
    
    func fetchProducts(page: Int, completion: @escaping (Result<ProductData, APIError>) -> Void) {
        let baseURL = "\(baseURL)\(contentProductURL)"
        let parameters: [String: Any] = ["page": page]
        AF.request(baseURL, parameters: parameters).responseDecodable(of: ProductData.self) { response in
            switch response.result {
            case .success(let value):
                 completion(.success(value))
            case .failure(_):
                completion(.failure(.requestFailed))
            }
        }
    }
    
    func fetchFavorite(page: Int, completion: @escaping (Result<ProductData, APIError>) -> Void) {
        let baseURL = "\(baseURL)\(contentFavoriteURL)"
        let parameters: [String: Any] = ["page": page]
        AF.request(baseURL, parameters: parameters).responseDecodable(of: ProductData.self) { response in
            switch response.result {
            case .success(let value):
                 completion(.success(value))
            case .failure(_):
                completion(.failure(.requestFailed))
            }
        }
    }
}
