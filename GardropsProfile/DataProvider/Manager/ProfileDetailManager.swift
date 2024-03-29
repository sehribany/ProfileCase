//
//  ProfileDetailManager.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

import Foundation
import Alamofire

class ProfileDetailManager{
    static let shared = ProfileDetailManager()
    private lazy var baseURL: String = Constants.shared.baseURL
    let contentURL: String = Constants.shared.profileDetailURL

    func fetchProfileDetails(completion: @escaping (Result<Profile, APIError>) -> Void) {
        AF.request("\(baseURL)\(contentURL)").responseDecodable(of: Profile.self) { response in
            switch response.result {
            case .success(let profile):
                completion(.success(profile))
            case .failure(let error):
                completion(.failure(.requestFailed))
                print("Error: \(error)")
            }
        }
    }
}
