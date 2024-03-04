//
//  PaymentHandler.swift
//  AppleWatchStore
//
//  Created by Radu Petrisel on 04.03.2024.
//

import Foundation
import PassKit

typealias PaymentCompletionHandler = (Bool) -> Void

final class PaymentHandler: NSObject{
    var paymentController: PKPaymentAuthorizationController?
    var paymentSummaryItems = [PKPaymentSummaryItem]()
    var paymentStatus = PKPaymentAuthorizationStatus.failure
    var completionHandler: PaymentCompletionHandler?
    
    static let supportedNetworks: [PKPaymentNetwork] = [
        .amex,
        .discover,
        .masterCard,
        .visa
    ]
    
    func shippingMethodCalculator() -> [PKShippingMethod] {
        let today = Date.now
        let calendar = Calendar.current
        
        let shippingStartDate = calendar.date(byAdding: .day, value: 5, to: today)
        let shippingEndDate = calendar.date(byAdding: .day, value: 10, to: today)
        
        guard let shippingStartDate, let shippingEndDate else { return [] }
        
        let startComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingStartDate)
        let endComponents = calendar.dateComponents([.calendar, .year, .month, .day], from: shippingEndDate)
        
        let shippingDelivery = PKShippingMethod(label: "Delivery", amount: NSDecimalNumber(string: "0.00"))
        shippingDelivery.dateComponentsRange = PKDateComponentsRange(start: startComponents, end: endComponents)
        shippingDelivery.detail = "Your products have been sent to your address."
        shippingDelivery.identifier = "DELIVERY"
        
        return [shippingDelivery]
    }
    
    func startPayment(products: [CartProduct], total: Int, completion: @escaping PaymentCompletionHandler) {
        completionHandler = completion
        
        paymentSummaryItems = products.map { product in
            PKPaymentSummaryItem(label: product.name, amount: NSDecimalNumber(string: "\(product.caseAmount).00"), type: .final)
        }
        
        let total = PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(string: "\(total).00"), type: .final)
        paymentSummaryItems.append(total)
        
        let paymentRequest = PKPaymentRequest()
        paymentRequest.paymentSummaryItems = paymentSummaryItems
        paymentRequest.merchantIdentifier = "merchant.ios.radupetrisel.applewatchstore"
        paymentRequest.merchantCapabilities = .threeDSecure
        paymentRequest.countryCode = "RO"
        paymentRequest.currencyCode = "USD"
        paymentRequest.supportedNetworks = Self.supportedNetworks
        paymentRequest.shippingType = .delivery
        paymentRequest.shippingMethods = shippingMethodCalculator()
        paymentRequest.requiredShippingContactFields = [.name, .postalAddress]
        
        paymentController = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        paymentController?.delegate = self
        paymentController?.present { presented in
            if presented {
                debugPrint("Presented payment controller")
            } else {
                debugPrint("Failed to present payment controller")
            }
        }
    }
}

extension PaymentHandler: PKPaymentAuthorizationControllerDelegate {
    
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController, didAuthorizePayment payment: PKPayment, handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        let errors = [Error]()
        let status = PKPaymentAuthorizationStatus.success
        
        self.paymentStatus = status
        completion(PKPaymentAuthorizationResult(status: status, errors: errors))
    }
    
    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            DispatchQueue.main.async {
                if self.paymentStatus == .success {
                    if let completionHandler = self.completionHandler {
                        completionHandler(true)
                    }
                } else {
                    if let completionHandler = self.completionHandler {
                        self.paymentStatus = .failure
                        completionHandler(false)
                    }
                }
            }
        }
    }
}
