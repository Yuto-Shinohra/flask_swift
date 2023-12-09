//
//  ScannerModel.swift
//  flask_uploader
//
//  Created by 篠原優仁 on 2023/12/09.
//

import Foundation
import VisionKit
final class ScannerModel: NSObject, ObservableObject {
    @Published var imageArray: [UIImage] = []
    
    func getDocumentCameraViewController() -> VNDocumentCameraViewController {
        let vc = VNDocumentCameraViewController()
        vc.delegate = self
        return vc
    }
}
extension ScannerModel: VNDocumentCameraViewControllerDelegate {
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        for i in 0..<scan.pageCount {
            self.imageArray.append(scan.imageOfPage(at: i))
        }
        controller.dismiss(animated: true)
    }
}
