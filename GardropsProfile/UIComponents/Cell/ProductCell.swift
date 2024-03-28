//
//  ProductCell.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 25.03.2024.
//

import UIKit

public class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    
    public static var identifier: String = "ProductCell"
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let priceTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .appBlack
        label.textAlignment = .left
        return label
    }()
    
    private let brandTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .appWriteGray
        label.textAlignment = .left
        return label
    }()
    
    weak var viewModel: ProductCellProtocol?
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
    }
}
//MARK: -UILayout
extension ProductCell{
    private func addSubViews(){
        addImageView()
        addPriceText()
        addBrandText()
    }
    
    private func addImageView(){
        addSubview(imageView)
        imageView.topToSuperview()
        imageView.leadingToSuperview()
        imageView.width(172)
        imageView.height(280)
    }
    
    private func addPriceText(){
        addSubview(priceTitle)
        priceTitle.topToBottom(of: imageView).constant = 5
        priceTitle.leadingToSuperview().constant = 6
    }
    
    private func addBrandText(){
        addSubview(brandTitle)
        brandTitle.topToBottom(of: priceTitle).constant = 4
        brandTitle.leadingToSuperview().constant = 6
    }
    
    public func set(viewModel: ProductCellProtocol){
        self.viewModel = viewModel
        let product = viewModel.product
        imageView.setImage(product.image)
        priceTitle.text = product.price
        brandTitle.text = product.brand
    }
}
