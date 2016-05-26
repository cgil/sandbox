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
    
    let contentController = WKUserContentController()
    let userScript = WKUserScript(
      source: "redHeader()",
      injectionTime: WKUserScriptInjectionTime.AtDocumentStart,
      forMainFrameOnly: true
    )
    contentController.addUserScript(userScript)
    
    contentController.addScriptMessageHandler(
      self,
      name: "callbackHandler"
    )
    
    let config = WKWebViewConfiguration()
    config.userContentController = contentController
    
    let navBarHeight = self.navigationController!.navigationBar.frame.size.height
    let containerViewHeight = self.containerView.bounds.height
    let containerViewWidth = self.containerView.bounds.width
    let padding:CGFloat = 20
    
    self.webView = WKWebView(
      frame: CGRectMake(0, navBarHeight + padding, containerViewWidth, containerViewHeight - navBarHeight),
      configuration: config
    )
    self.webView!.navigationDelegate = self
    self.view.addSubview(self.webView!)
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if revealViewController() != nil {
      menuButton.target = revealViewController()
      menuButton.action = "revealToggle:"
      view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    let url = NSURL(string: "http://172.20.10.2:8100")
    let request = NSURLRequest(URL: url!)
    
    self.webView!.loadRequest(request)
    
    automaticallyAdjustsScrollViewInsets = false
    
  }
  
  func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
    if(message.name == "callbackHandler") {
      print("JavaScript is sending a message \(message.body)")
      
      // Get the view controller
      
      let vcNew = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Feed Navigation Controller")
      
      // Swap out the Front view controller and display
      self.revealViewController().setFrontViewController(vcNew, animated: true)
      self.revealViewController().setFrontViewPosition(FrontViewPosition.Left, animated: true)
//
//      UINavigationController *navigationController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
//      MBFancyViewController *viewController = navigationController.viewControllers[0];
//      
//      // setup "inner" view controller
//      viewController.foo = bar;
//      
//      [self presentViewController:navigationController animated:YES completion:nil];
      
    }
  }
  
//    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage)
//    {
//      if(message.name == "callbackHandler") {
//        print("Launch my Native Camera")
//      }
//    }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
