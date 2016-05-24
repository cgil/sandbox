//
//  WebViewController.swift
//  SidebarMenu
//
//  Created by Andy Miller on 5/23/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
  
    @IBOutlet weak var menuButton:UIBarButtonItem!
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
      super.viewDidLoad()
      
      if revealViewController() != nil {
        menuButton.target = revealViewController()
        menuButton.action = "revealToggle:"
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
      }
      
      let url = NSURL(string: "192.168.1.122")
      let request = NSURLRequest(URL: url!)
      
      webView.delegate = self
      webView.loadRequest(request)
      
      automaticallyAdjustsScrollViewInsets = false
      
    }
  
    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
    }
  

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
