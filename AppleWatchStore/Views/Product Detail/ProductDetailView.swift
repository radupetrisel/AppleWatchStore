//
//  ProductDetailView.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 26.11.2023.
//

import SwiftUI

struct ProductDetailView: View {
    @Environment(ShoppingCart.self) var cart
    @Environment(ProductDetail.self) var productDetail
    
    private let horizontalPadding: Double = 15
    
    @State var product: Product
    
    var caseSizesOrdered: [CaseSize] {
        product.caseSizes.sorted(by: { $0.order < $1.order })
    }
    
    var wristSizesOrdered: [WristSize] {
        product.wristSizes.sorted(by: { $0.order < $1.order })
    }
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width - 2 * horizontalPadding
            ZStack {
                ScrollView {
                    header(width: width > 0 ? width : 0)
                    colors
                    
                    VStack(spacing: 50) {
                        ProductDetailDescriptionView(product: product)
                        CaseSizesView(caseSizes: caseSizesOrdered)
                        WristSizesView(wristSizes: wristSizesOrdered)
                        ConnectivityView()
                        AppleCareView()
                    }
                    .padding(.horizontal, horizontalPadding)
                }
            }
            .safeAreaInset(edge: .bottom) {
                ZStack {
                    addToCart
                }
                .frame(height: 80)
                .padding(.vertical, 10)
                .background(.ultraThinMaterial)
            }
        }
    }
    
    @ViewBuilder
    func header(width: Double) -> some View {
        ZStack(alignment: .bottom) {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gradient)
                    .frame(height: 280 / 1.1)
            }
            
            ZStack {
                Image(product.band)
                    .resizable()
                    .frame(width: width, height: width)
                
                Image(product.face)
                    .resizable()
                    .frame(width: width, height: width)
            }
        }
        .padding(.horizontal)
    }
    
    var colors: some View {
        VStack {
            SectionHeader(title: "Band Colors")
            
            HStack {
                ForEach(0..<3) { item in
                    Circle()
                        .fill(Color.gray)
                    .frame(width: 32, height: 32)
                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    var addToCart: some View {
        Button {
            cart.addCartProduct(
                product: product,
                caseSize: productDetail.selectedCaseSize,
                wristSize: productDetail.selectedWristSize,
                cellType: productDetail.selectedGPSCellular)
            
            productDetail.hasAddedToCart.toggle()
            reset()
        } label: {
            Text("Add To Cart")
                .condensedLowercased(.medium, size: 24)
                .foregroundStyle(.white)
        }
        .buttonStyle(.customBorderedBlack)
        .padding(.horizontal)
    }
    
    func reset() {
        productDetail.selectedCaseSize = nil
        productDetail.selectedWristSize = nil
        productDetail.selectedAppleCare = .none
        productDetail.selectedGPSCellular = .none
        
        productDetail.hasAddedToCart.toggle()
    }
}

#Preview {
    ProductDetailView(product: .default)
}
