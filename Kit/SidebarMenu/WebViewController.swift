//
//  WebViewController.swift
//  Kit
//
//  Created by Andy Miller on 5/23/16.
//  Copyright © 2016 Tote. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
  
  @IBOutlet var containerView: UIView!
  
  var urlString: String?
  var webView: UIWebView?
  
  override func loadView() {
    super.loadView()
    
    // Instantiate UIWebView with specified bounds.
    self.webView = UIWebView(frame: self.containerView.bounds)
    
    // Render UIWebView to view.
    self.view.addSubview(self.webView!)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Menu button.
    if revealViewController() != nil {
      // Add Menu Button and link to SWReveal Library.
      let button: UIButton = UIButton(type: UIButtonType.Custom)
      button.setImage(UIImage(named: "menu.png"), forState: UIControlState.Normal)
      button.addTarget(revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
      button.frame = CGRectMake(0, 0, 22.6, 17.3)
      let barButton = UIBarButtonItem(customView: button)
      self.navigationItem.leftBarButtonItem = barButton
      
      // Reveal menu on swipe.
      view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }

    // Load URL.
    let url = NSURL(string: urlString ?? "https://clutch.totestore.com/#/68a4f1da-a6ca-4ae3-b0e8-bef07ce2f429")
    let request = NSURLRequest(URL: url!)
    self.webView!.loadRequest(request)
    
  }
  
}
