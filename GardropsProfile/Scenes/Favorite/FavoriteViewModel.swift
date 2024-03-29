//
//  FavoriteViewModel.swift
//  GardropsProfile
//
//  Created by Şehriban Yıldırım on 25.03.2024.
//

import Foundation

protocol FavoriteViewDataSource {
    func numberOfItemsAt(section: Int) -> Int
    func cellItemAt(indexPath: IndexPath) -> ProductCellProtocol
}

protocol FavoriteViewProtocol: FavoriteViewDataSource{}

final class FavoriteViewModel: FavoriteViewProtocol {
    var cellItems: [ProductCellProtocol] = []
    var currentPage = 0

    func numberOfItemsAt(section: Int) -> Int {
        return cellItems.count
    }
    
    func cellItemAt(indexPath: IndexPath) -> ProductCellProtocol {
        return cellItems[indexPath.row]
    }
}

// MARK: - Network
extension FavoriteViewModel{
    func fetchData(page: Int, completion: @escaping (Result<ProductData, APIError>) -> Void){
        ProductDetailManager.shared.fetchProducts(page: currentPage) { results in
            switch results{
            case.success(let products):
                let cellItems = products.data.products.map({ProductCellModel(product: $0)})
                self.cellItems.append(contentsOf: cellItems)
                completion(.success(products))
            case.failure(let error): print(error)
            }
        }
    }
}
