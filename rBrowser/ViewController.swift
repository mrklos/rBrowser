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
    //d
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }

    @IBAction func buttonPressed(){
        if(!(urlBar.text?.isEmpty)!){
            let url = NSURL(string: urlBar.text!)
            let webContentModel = WebContentModel()
            let htmlString = webContentModel.returnReversedTextWebsite(url!)
            webView.loadHTMLString(htmlString, baseURL:url)
        }
    }
}

