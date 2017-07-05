//
//  ViewController.swift
//  Download
//
//  Created by MrDummy on 7/5/17.
//  Copyright © 2017 Huy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgDownload: UIImageView!
    @IBOutlet weak var txtURL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnDownload(_ sender: Any) {
        if txtURL.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please input URL", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        } else {
            let url = txtURL.text
            downloadImageWithURL(url!)
        }
    }

    @IBAction func btnClear(_ sender: Any) {
        txtURL.text = ""
        imgDownload.image = nil
    }
    
    func downloadImageWithURL(_ url: String) {
        let imgURL = URL(string: url)
        (URLSession(configuration: .default)).dataTask(with: imgURL!, completionHandler: {(dataImage, response, error) in
            if let data = dataImage {
                DispatchQueue.main.async() { () -> Void in
                    self.imgDownload.image = UIImage(data: data)
                }
            }
        }).resume()
    }
}

