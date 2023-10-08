//
//  QrScanViewController.swift
//  Mobile-App-Pembayaran-QRIS
//
//   Created by Dito on 07/10/23.
//

import Foundation
import UIKit
import AVFoundation

class QRScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    
    
    // MARK: - Properties
    var presenter: QRScannerViewToPresenterProtocol?
    var video = AVCaptureVideoPreviewLayer()
    var qrCodeFrameView = UIView()

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        configureCaptureDevice()
    }
    
    let merchantNameLabel = UILabel()
    let transactionAmountLabel = UILabel()
    let transactionIdLabel = UILabel()


    // MARK: - Helpers
    private func configureViews() {
        title = "Scan QR"
        let previewView = UIView()
        previewView.frame = view.bounds
        previewView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(previewView)

        merchantNameLabel.text = ""
        transactionAmountLabel.text = ""
        transactionIdLabel.text = ""
        
        merchantNameLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionAmountLabel.translatesAutoresizingMaskIntoConstraints = false
        transactionIdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        previewView.addSubview(merchantNameLabel)
        previewView.addSubview(transactionAmountLabel)
        previewView.addSubview(transactionIdLabel)
        
        // Add constraints to position the labels
        NSLayoutConstraint.activate([
            merchantNameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            merchantNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            
            transactionAmountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transactionAmountLabel.topAnchor.constraint(equalTo: merchantNameLabel.bottomAnchor, constant: 20),
            
            transactionIdLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            transactionIdLabel.topAnchor.constraint(equalTo: transactionAmountLabel.bottomAnchor, constant: 20)
        ])
        
        qrCodeFrameView.frame = CGRect.zero
        qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView.layer.borderWidth = 2
        previewView.addSubview(qrCodeFrameView)
        previewView.bringSubviewToFront(qrCodeFrameView)
    }

    private func configureCaptureDevice() {
        let session = AVCaptureSession()
        guard let captureDevice = AVCaptureDevice.default(for: .video) else {
            print("Failed to access camera.")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        } catch {
            print(error)
            return
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: .main)
        output.metadataObjectTypes = [.qr]
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
        view.layer.addSublayer(video)
        session.startRunning()
    }
}
