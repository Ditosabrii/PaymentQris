//
//  QRScanRouter.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation

class QRScannerRouter: QRScannerPresenterToRouterProtocol {
    static func createQRScannerModule() -> UIViewController {
        let view = QRScannerViewController()
        let presenter: QRScannerViewToPresenterProtocol & QRScannerInteractorToPresenterProtocol = QRScannerPresenter()
        let interactor: QRScannerPresenterToInteractorProtocol = QRScannerInteractor()
        let router: QRScannerPresenterToRouterProtocol = QRScannerRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
