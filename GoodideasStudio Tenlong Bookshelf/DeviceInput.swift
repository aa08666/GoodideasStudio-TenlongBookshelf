////
////  DeviceInput.swift
////  GoodideasStudio Tenlong Bookshelf
////
////  Created by 柏呈 on 2019/6/12.
////  Copyright © 2019 Jerry. All rights reserved.
////
//
//import Foundation
//import AVFoundation
//
//class DeviceInput: NSObject {
//    var frontWildAngleCamera: AVCaptureDeviceInput?
//    var bcackWildAngleCamera: AVCaptureDeviceInput?
//    var backTelephotoCamera: AVCaptureDeviceInput?
//    var backDualCamera: AVCaptureDeviceInput?
//    
//    func getAllCameras() {
//        let cameraDevices = AVCaptureDevice.DiscoverySession(deviceTypes: [.builtInWideAngleCamera, .builtInTelephotoCamera, .builtInDualCamera], mediaType: .video, position: .unspecified).devices
//        
//        for camera in cameraDevices {
//            let inputDevice = try! AVCaptureDeviceInput(device: camera)
//            
//            if camera.deviceType == .builtInWideAngleCamera, camera.position == .front {
//                frontWildAngleCamera = inputDevice
//            }
//            
//            if camera.deviceType == .builtInWideAngleCamera, camera.position == .back {
//                backTelephotoCamera = inputDevice
//            }
//            
//            if camera.deviceType == .builtInDualCamera {
//                backDualCamera = inputDevice
//            }
//        }
//    }
//    
//    override init() {
//        super.init()
//        getAllCameras()
//    }
//    
//    
//}
//
//
