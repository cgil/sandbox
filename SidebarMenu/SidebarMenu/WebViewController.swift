//
//  WebViewController.swift
//  SidebarMenu
//
//  Created by Andy Miller on 5/23/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate {
  
  @IBOutlet weak var menuButton:UIBarButtonItem!
  @IBOutlet var containerView: UIView!
  
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
    
    
    // RevealViewController Library calls control swipe menu gestures.
    if revealViewController() != nil {
      menuButton.target = revealViewController()
      menuButton.action = "revealToggle:"
      view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    // Load URL.
    let url = NSURL(string: "http://172.20.10.2:8100")
    let request = NSURLRequest(URL: url!)
    self.webView!.loadRequest(request)
    
  }
  
  func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
    if(message.name == "callbackHandler") {
      print("JavaScript is sending a message \(message.body)")
      
      // Get the view controller
      
      let vcNew = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Feed Navigation Controller")
      
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
