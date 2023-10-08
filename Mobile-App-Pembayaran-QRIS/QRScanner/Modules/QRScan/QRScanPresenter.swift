//
//  QRScanPresenter.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23
//

import Foundation

class QRScannerPresenter: QRScannerViewToPresenterProtocol {
    weak var view: QRScannerPresenterToViewProtocol?
    var interactor: QRScannerPresenterToInteractorProtocol?
    var router: QRScannerPresenterToRouterProtocol?
    
    func updateView(jsonString: String) {
        interactor?.captureQRCode(jsonString: jsonString)
    }
}

extension QRScannerPresenter: QRScannerInteractorToPresenterProtocol {
    func didCaptureQRCode(details: QRScannerResponse) {
        view?.showQRCodeDetails(details: details)
    }
    
    func didCaptureQRCodeFailed() {
        view?.showError()
    }
}
