//
//  ViewController.swift
//  rBrowser
//
//  Created by Paweł Kłosowicz on 19/05/16.
//  Copyright © 2016 Paweł Kłosowicz. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet var urlBar : UITextField!
    @IBOutlet var webView : UIWebView!
    @IBOutlet var button : UIButton!

    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    // MARK: User interaction

    @IBAction func buttonPressed() {
        if let text = urlBar.text where !text.isEmpty {
            if let url = NSURL(string: text) {
                let webContentModel = WebContentModel()
                if let htmlString = webContentModel.getReversedTextWebsite(url) {
                    webView.loadHTMLString(htmlString, baseURL:url)
                }
            }
        }
    }
}

