//
//  ViewController.swift
//  DownloaderNotification
//
//  Created by Swift on 22/09/2018.
//  Copyright © 2018 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    
    //referenciando AppDelegate
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    let nc = NotificationCenter.default

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nc.addObserver(forName: ImageDownloader.downloadNotification, object: nil, queue: .main) {[weak self] (notification) in
            let originalImage = notification.userInfo?["OriginalImage"] as? UIImage
            self?.imageView.image = originalImage
        }
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func downloadImage() {
        let address = "https://aml-prod-cdn.azureedge.net/aml-prod-sitefinity-custom/images/default-source/models/db11/db11_05_asset_019b9d02b9cf8b697fbc60ff00000f1b3f.jpg?sfvrsn=ab166bf9_2&w=1080&quality=60"
        appDelegate?.imageDownloader.download(address: address)
        
    }
    
}

