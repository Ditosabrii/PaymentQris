//
//  QrScanEntity.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation

struct QRScannerResponse: Codable {
    var bankSource: String?
    var transactionId: String?
    var merchantName: String?
    var transactionAmount: String?
}
