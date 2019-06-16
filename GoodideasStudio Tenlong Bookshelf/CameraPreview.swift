////
////  CameraPreview.swift
////  GoodideasStudio Tenlong Bookshelf
////
////  Created by 柏呈 on 2019/6/12.
////  Copyright © 2019 Jerry. All rights reserved.
////
//
//import Foundation
//import AVFoundation
//import UIKit
//
//class CameraPreviewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
//
//    @IBOutlet weak var codeLabel: UILabel!
//    @IBOutlet weak var typeLabel: UILabel!
//    @IBOutlet weak var forPreview: UIView!
//    let session = AVCaptureSession()
//    let deviceInput = DeviceInput()
//
//    func settingPreviewLayer() {
//        let previewLayer = AVCaptureVideoPreviewLayer()
//        previewLayer.frame = forPreview.bounds
//        previewLayer.session = session
//        previewLayer.videoGravity = .resizeAspectFill
//        forPreview.layer.addSublayer(previewLayer)
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        settingPreviewLayer()
//        // 將後置廣角鏡頭連接到協調器
//        session.addInput(deviceInput.bcackWildAngleCamera!)
//        // 設定輸出端為 meta 資料 （e.g. 條碼內容）
//        let output = AVCaptureMetadataOutput()
//        session.addOutput(output)
//        // 接受所有可辨識的 meta 資料
//        output.metadataObjectTypes = output.availableMetadataObjectTypes
//        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.global())
//        // 資料開始流入
//        session.startRunning()
//
//    }
//
//    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
//        for metaData in metadataObjects {
//            if let data = metaData as? AVMetadataMachineReadableCodeObject {
//                DispatchQueue.main.async {
//                    self.codeLabel.text = data.stringValue
//                    self.typeLabel.text = data.type.rawValue
//                }
//            }
//        }
//    }
//}
