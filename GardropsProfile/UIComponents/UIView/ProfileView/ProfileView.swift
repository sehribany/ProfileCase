//
//  ProfileView.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 25.03.2024.
//

import UIKit

class ProfileView: UIView {
    
    private let profileImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let userDetailStack: UIStackView = {
        let stackView     = UIStackView()
        stackView.axis    = .horizontal
        stackView.spacing = 0
        return stackView
    }()
    
    private let gardropsStackView: UIStackView = {
        let stackView     = UIStackView()
        stackView.axis    = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private let followerStackView: UIStackView = {
        let stackView     = UIStackView()
        stackView.axis    = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private let shoppingStackView: UIStackView = {
        let stackView     = UIStackView()
        stackView.axis    = .vertical
        stackView.spacing = 5
        return stackView
    }()
    
    private let gardropsNumber: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.textAlignment = .center
        label.text = """
                        27
                        Gardrops'u
                     """
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12,weight: .bold)
        return label
    }()
    
    private let followerNumber: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12,weight: .bold)
        label.text = """
                        134
                        Takipçi
                     """
        return label
    }()
    
    private let shoppingNumber: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12,weight: .bold)
        label.text = """
                        267
                        Alışveriş
                    """
        return label
    }()
    
    private let verificationImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "icVerification")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let verificationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 12,weight: .regular)
        label.text = "Telefonla doğrulandı"
        return label
    }()
    
    private let dateImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "icDate")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 12,weight: .regular)
        label.text = "2 yıl önce üye oldu"
        return label
    }()
    
     private let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appGray
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 13,weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Kendim hakkında bir bio yazacak olsam ne yazardım diye düşündüm.😃"
        return label
    }()
    
    private let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0.5
        button.layer.borderColor = UIColor.appLineGray.cgColor
        button.setTitle("Takip Et", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14,weight: .regular)
        button.tintColor = .appGray
        return button
    }()
    
    private let sendMessageButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 8
        button.setTitle("Mesaj Gönder", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14,weight: .regular)
        button.tintColor = .appWhite
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.appPink1.cgColor, UIColor.appPink2.cgColor]
        gradientLayer.frame = CGRect(x: 0, y: 0, width: 200, height: 40)
        gradientLayer.cornerRadius = 8
        button.layer.insertSublayer(gradientLayer, at: 0)
        button.layer.masksToBounds = true
        return button
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()

    }
}

//MARK: -UILayout
extension ProfileView{
    private func addSubViews(){
        backgroundColor = .appWhite
        addImageView()
        addGardropsStackView()
        addFolllowerStackView()
        addShoppingStackView()
        addStackView()
        addVerification()
        addDate()
        addBio()
        addMessageButton()
        addFollowButton()
    }
    
    private func addImageView(){
        addSubview(profileImage)
        profileImage.image = UIImage(named: "a")
        profileImage.width(86)
        profileImage.height(86)
        profileImage.layer.cornerRadius = 43
        profileImage.layer.masksToBounds = true
        profileImage.layer.borderWidth = 1
        profileImage.layer.borderColor = UIColor.appWriteGray.cgColor
        profileImage.topToSuperview().constant = 92
        profileImage.leadingToSuperview().constant = 16
    }
    
    private func addGardropsStackView(){
        addSubview(gardropsStackView)
        gardropsStackView.addArrangedSubview(gardropsNumber)
    }
    
    private func addFolllowerStackView(){
        addSubview(followerStackView)
        followerStackView.addArrangedSubview(followerNumber)
    }
    
    private func addShoppingStackView(){
        addSubview(shoppingStackView)
        shoppingStackView.addArrangedSubview(shoppingNumber)
    }
    
    private func addStackView(){
        addSubview(userDetailStack)
        userDetailStack.topToSuperview().constant = 119
        userDetailStack.leadingToTrailing(of: profileImage).constant = 5
        userDetailStack.trailingToSuperview().constant = -7
        userDetailStack.addArrangedSubview(gardropsStackView)
        userDetailStack.addArrangedSubview(followerStackView)
        userDetailStack.addArrangedSubview(shoppingStackView)
    }
    
    private func addVerification(){
        addSubview(verificationImage)
        addSubview(verificationLabel)
        verificationImage.leadingToSuperview().constant = 17
        verificationImage.topToSuperview().constant = 188
        verificationLabel.leftToSuperview().constant = 39
        verificationLabel.topToSuperview().constant = 189
    }
    
    private func addDate(){
        addSubview(dateImage)
        addSubview(dateLabel)
        dateImage.leadingToSuperview().constant = 17
        dateImage.topToSuperview().constant = 211
        dateLabel.leftToSuperview().constant = 39
        dateLabel.topToSuperview().constant = 212
    }
    
    private func addBio(){
        addSubview(bioLabel)
        bioLabel.topToSuperview().constant = 238
        bioLabel.leadingToSuperview().constant = 18
        bioLabel.width(212)
        bioLabel.sizeToFit()
    }
    
    func bioHeight() -> CGFloat{
        let bioHeight = bioLabel.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        return bioHeight + 312
    }
    
    private func addFollowButton(){
        addSubview(followButton)
        followButton.trailingToLeading(of: sendMessageButton).constant = -10
        followButton.height(38)
        followButton.leadingToSuperview().constant = 16
        followButton.topToBottom(of: bioLabel).constant = 20
    }
    
    private func addMessageButton(){
        addSubview(sendMessageButton)
        sendMessageButton.height(38)
        sendMessageButton.leadingToSuperview().constant = 200
        sendMessageButton.trailingToSuperview().constant = -16
        sendMessageButton.topToBottom(of: bioLabel).constant = 20
        sendMessageButton.bottomToSuperview().constant = -10
    }
}
