//
//  PaymentProtocol.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation
import UIKit

protocol PaymentQRPresenterToViewProtocol: AnyObject {
    func paymentSuccess(details: QRScannerResponse)
    func showError()
}

protocol PaymentQRInteractorToPresenterProtocol: AnyObject {
    func didCaptureQRCode(details: QRScannerResponse)
    func didCaptureQRCodeFailed()
}

protocol PaymentQRPresenterToInteractorProtocol: AnyObject {
    var presenter: PaymentQRInteractorToPresenterProtocol? { get set }
    
    func captureQRCode(jsonString: String)
}

protocol PaymentQRViewToPresenterProtocol: AnyObject {
    var view: PaymentQRPresenterToViewProtocol? { get set }
    var interactor: PaymentQRPresenterToInteractorProtocol? { get set }
    var router: PaymentQRPresenterToRouterProtocol? { get set }
    
    func updateView(jsonString: String)
}

protocol PaymentQRPresenterToRouterProtocol: AnyObject {
    static func createPaymentQRModule() -> UIViewController
}
