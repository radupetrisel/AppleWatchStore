//
//  ShoppingCart.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 03.03.2024.
//

import Combine
import Foundation
import SwiftData

@Observable
final class ShoppingCart: Identifiable {
    let id = UUID()
    var quantity: Int = 0
    var cartTotal: Int = 0
    var productCount: Int = 0
    
    private(set) var products: [CartProduct] = []
    
    var total: Double { products.reduce(Double.zero) { total, product in total + Double(product.caseAmount) * Double(product.quantity) } }
    
    var cartQuantity: Int { products.count }
    
    func increment(product: CartProduct) {
        product.quantity += 1
        updateProduct(product)
    }
    
    func decrement(product: CartProduct) {
        product.quantity -= 1
        updateProduct(product)
        
        guard let index = products.firstIndex(where: { $0.id == product.id }) else {
            preconditionFailure("Error: Not able to find a product from the shopping cart.")
        }
        
        if product.quantity == 0 {
            products.remove(at: index)
        }
    }
    
    func addCartProduct(product: Product, caseSize: CaseSize?, wristSize: WristSize?, cellType: ProductCellularType) {
        if let caseSize, let wristSize {
            let formatted = wristSize.size.replacingOccurrences(of: " ", with: "")
            let newProductId = product.createCartProductId(caseSize: caseSize.size, wristSize: formatted).lowercased()
            
            guard let cartProduct = products.first(where: { $0.id == newProductId }) else {
                let newProduct = CartProduct(product: product, caseSize: caseSize, wristSize: wristSize, cellularType: cellType, quantity: 1)
                productCount += 1
                
                return products.append(newProduct)
            }
            
            increment(product: cartProduct)
        }
    }
    
    func remove(atOffsets indices: IndexSet) {
        products.remove(atOffsets: indices)
    }
    
    func getTax() -> Double { total * 0.13 }
    
    func getOrderTotal() -> Double { total + getTax() }
    
    private func updateProduct(_ product: CartProduct) {
        guard let index = products.firstIndex(where: { $0.id == product.id }) else {
            preconditionFailure("Error: Not able to find a product from the shopping cart.")
        }
        
        products[index] = product
    }
}
