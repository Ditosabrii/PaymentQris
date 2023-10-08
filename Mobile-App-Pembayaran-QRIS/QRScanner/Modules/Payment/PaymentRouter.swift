//
//  PaymentRouter.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation
import UIKit


class PaymentQRRouter: PaymentQRPresenterToRouterProtocol {
    static func createPaymentQRModule() -> UIViewController {
        let view = PaymentQRViewController()
        let presenter: PaymentQRViewToPresenterProtocol & PaymentQRInteractorToPresenterProtocol = PaymentQRPresenter()
        let interactor: PaymentQRPresenterToInteractorProtocol = PaymentQRInteractor()
        let router: PaymentQRPresenterToRouterProtocol = PaymentQRRouter()
        
        view.presenter = presenter
        presenter.view = view as? any PaymentQRPresenterToViewProtocol
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
