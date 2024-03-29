//
//  ProfileDetail.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 26.03.2024.
//

// MARK: - ProfileDetail
struct ProfileDetail: Codable {
    let id, username: String
    let avatar      : String
    let registeredAt: String
    let isVerifiedByPhone: Bool
    let bio         : String
    let isFollowing : Bool
    let primaryButtonTitle, secondaryButtonTitle: String
}
