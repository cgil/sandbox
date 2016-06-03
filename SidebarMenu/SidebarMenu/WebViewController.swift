//
//  WebViewController.swift
//  SidebarMenu
//
//  Created by Andy Miller on 5/23/16.
//  Copyright © 2016 Tote. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
  
  @IBOutlet var containerView: UIView!
  
  var urlString: String?
  var webView: WKWebView?
  
  override func loadView() {
    super.loadView()
    
    // ContentController class rovides a way for JavaScript to post messages and inject user scripts to a web view.
    let contentController = WKUserContentController()
    contentController.addScriptMessageHandler(
      self,
      name: "callbackHandler"
    )
    
    // WKWebViewConfiguration is a collection of properties with which to initialize a web view.
    let config = WKWebViewConfiguration()
    config.userContentController = contentController
    
    // Instantiate WKWebView with specified bounds.
    self.webView = WKWebView(
      frame: self.containerView.bounds,
      configuration: config
    )
    
    // Navigation Delegate provides methods for tracking the progress of main frame navigations and for deciding load policy for main frame and subframe navigations.
    self.webView!.navigationDelegate = self
    
    // Render WKWebView to view.
    self.view.addSubview(self.webView!)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // SWReveal powers swipe gestures.
    if revealViewController() != nil {
      // Add Menu Button and link to SWReveal Library.
      let button: UIButton = UIButton(type: UIButtonType.Custom)
      button.setImage(UIImage(named: "menu.png"), forState: UIControlState.Normal)
      button.addTarget(revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
      button.frame = CGRectMake(0, 0, 22.6, 17.3)
      let barButton = UIBarButtonItem(customView: button)
      self.navigationItem.leftBarButtonItem = barButton
    }

    // Load URL.
    let url = NSURL(string: urlString ?? "https://clutch-store.herokuapp.com/")
    let request = NSURLRequest(URL: url!)
    self.webView!.loadRequest(request)
    
  }
  
  func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
    if(message.name == "callbackHandler") {
      print("JavaScript is sending a message \(message.body)")
      
      // Get the view controller
      
      let vcNew = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FeedNavController")
      
      // Swap out the Front view controller and display
      self.revealViewController().setFrontViewController(vcNew, animated: true)
      self.revealViewController().setFrontViewPosition(FrontViewPosition.Left, animated: true)
      
    }
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
