//
//  ImageDownloader.swift
//  DownloaderNotification
//
//  Created by Swift on 22/09/2018.
//  Copyright © 2018 Swift. All rights reserved.
//

import UIKit

class ImageDownloader {
    
    static let downloadNotification = Notification.Name(rawValue: "DownloadDidFinish")
    
    func download(address:String) {
        DispatchQueue.global().async {
            
            guard let urlImage = URL(string: address),
                let data = try? Data(contentsOf: urlImage),
                let image = UIImage(data:data) else {
                    
                    print("Erro ao baixar a imagem")
                    return
                    
            }
            
            let nc = NotificationCenter.default
            
            let userInfo : [String:Any] = [
                "SourceAddress" : address,
                "OriginalImage" : image
            ]
            
            nc.post(name: ImageDownloader.downloadNotification,
                    object: nil,
                    userInfo: userInfo)
            
        }
    }
    
}
