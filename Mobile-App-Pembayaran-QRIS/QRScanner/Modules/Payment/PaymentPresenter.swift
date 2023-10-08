//
//  PaymentPresenter.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation


class PaymentQRPresenter: PaymentQRViewToPresenterProtocol {
    weak var view: PaymentQRPresenterToViewProtocol?
    var interactor: PaymentQRPresenterToInteractorProtocol?
    var router: PaymentQRPresenterToRouterProtocol?
    
    func updateView(jsonString: String) {
        interactor?.captureQRCode(jsonString: jsonString)
    }
}

extension PaymentQRPresenter: PaymentQRInteractorToPresenterProtocol {
    func didCaptureQRCode(details: QRScannerResponse) {
        view?.paymentSuccess(details: details)
    }
    
    func didCaptureQRCodeFailed() {
        view?.showError()
    }
}
