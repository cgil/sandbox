//
//  ViewController.swift
//  WebViewDemo
//
//  Created by Ravi Shankar on 08/07/14.
//  Copyright (c) 2014 Ravi Shankar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate  {
    
    @IBOutlet var webView: UIWebView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.totestore.com")
        let request = NSURLRequest(URL: url!)
        
        webView.delegate = self
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        webView.loadRequest(request)
      
        self.title = "Tote Store"
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        activityIndicator.stopAnimating()
    }
    
    @IBAction func doRefresh(_: AnyObject) {
        webView.reload()
    }
    
    @IBAction func goBack(_: AnyObject) {
        webView.goBack()
    }
    
    @IBAction func goForward(_: AnyObject) {
        webView.goForward()
    }
    
    @IBAction func stop(_: AnyObject) {
        webView.stopLoading()
    }

}

