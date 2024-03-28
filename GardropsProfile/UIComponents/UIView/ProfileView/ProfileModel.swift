//
//  ProfileModel.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

class ProfileModel{
    func getuserDetail(completion: @escaping (Result<Profile, APIError>) -> Void){
        ProfileDetailManager.shared.fetchProfileDetails { results in
            completion(results)
        }
    }
}
