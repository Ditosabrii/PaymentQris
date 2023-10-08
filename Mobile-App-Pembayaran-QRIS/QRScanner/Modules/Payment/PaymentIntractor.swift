//
//  PaymentIntractor.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation

class PaymentQRInteractor: PaymentQRPresenterToInteractorProtocol {
    weak var presenter: PaymentQRInteractorToPresenterProtocol?
    
    func captureQRCode(jsonString: String) {
        let components = jsonString.split(separator: ".")
        if components.count == 4 {
            var qrDetails = QRScannerResponse()
            qrDetails.bankSource = String(components[0])
            qrDetails.transactionId = String(components[1])
            qrDetails.merchantName = String(components[2])
            qrDetails.transactionAmount = String(components[3])
            presenter?.didCaptureQRCode(details: qrDetails)
        } else {
            print("Invalid QR code format")
            presenter?.didCaptureQRCodeFailed()
        }
    }
}
