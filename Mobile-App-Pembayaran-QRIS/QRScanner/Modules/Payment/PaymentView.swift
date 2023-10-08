//
//  PaymentView.swift
//  Mobile-App-Pembayaran-QRIS
//
//  Created by Dito on 07/10/23.
//

import Foundation
import UIKit
import AVFoundation

class PaymentQRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    // MARK: - Properties
    var presenter: PaymentQRViewToPresenterProtocol?
    var video = AVCaptureVideoPreviewLayer()
    var qrCodeFrameView = UIView()
    var session = AVCaptureSession()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Payment QR"
        configureViews()
        configureCaptureDevice()
    }
    
    // MARK: - Helpers
    private func configureViews() {
        // Create a preview view
        let previewView = UIView()
        previewView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(previewView)
        
        // Add constraints for the preview view
        NSLayoutConstraint.activate([
            previewView.topAnchor.constraint(equalTo: view.topAnchor),
            previewView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            previewView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            previewView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Create a QR code frame view
        qrCodeFrameView.translatesAutoresizingMaskIntoConstraints = false
        qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView)
        
        // Add constraints for the QR code frame view
        NSLayoutConstraint.activate([
            qrCodeFrameView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            qrCodeFrameView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            qrCodeFrameView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            qrCodeFrameView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
    }
    
    private func configureCaptureDevice() {
        let captureDevice = AVCaptureDevice.default(for: .video)
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
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
        
        // Set the video layer's frame to match the preview view's bounds
        video.frame = view.layer.bounds
        
        // Add the video layer to the view's layer
        view.layer.addSublayer(video)
        
        // Start the session
        session.startRunning()
    }
}
