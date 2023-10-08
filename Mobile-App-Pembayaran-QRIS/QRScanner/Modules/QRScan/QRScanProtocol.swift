//
//  QRScanProtocol.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation
import UIKit

protocol QRScannerPresenterToViewProtocol: AnyObject {
    func showQRCodeDetails(details: QRScannerResponse)
    func showError()
}

protocol QRScannerInteractorToPresenterProtocol: AnyObject {
    func didCaptureQRCode(details: QRScannerResponse)
    func didCaptureQRCodeFailed()
}

protocol QRScannerPresenterToInteractorProtocol: AnyObject {
    var presenter: QRScannerInteractorToPresenterProtocol? { get set }
    
    func captureQRCode(jsonString: String)
}

protocol QRScannerViewToPresenterProtocol: AnyObject {
    var view: QRScannerPresenterToViewProtocol? { get set }
    var interactor: QRScannerPresenterToInteractorProtocol? { get set }
    var router: QRScannerPresenterToRouterProtocol? { get set }
    
    func updateView(jsonString: String)
}

protocol QRScannerPresenterToRouterProtocol: AnyObject {
    static func createQRScannerModule() -> UIViewController
}
