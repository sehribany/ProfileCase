//
//  ProductCellModel.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 25.03.2024.
//

import UIKit

public protocol ProductCellDataSource: AnyObject {
    var product: ProductDetail { get }
}

public protocol ProductCellProtocol: ProductCellDataSource {}

public final class ProductCellModel: ProductCellProtocol {
    public var product: ProductDetail
    
    init(product: ProductDetail) {
        self.product = product
    }
}
