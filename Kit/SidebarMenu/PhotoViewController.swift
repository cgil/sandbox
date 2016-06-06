//
//  PhotoViewController.swift
//  Kit
//
//  Created by Andy Miller on 5/23/16.
//  Copyright © 2016 Tote. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, BRYXBannerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Menu button.
    if revealViewController() != nil {
      // Add Menu Button and link to SWReveal Library.
      let button: UIButton = UIButton(type: UIButtonType.Custom)
      button.setImage(UIImage(named: "menu.png"), forState: UIControlState.Normal)
      button.addTarget(revealViewController(), action: "revealToggle:", forControlEvents: UIControlEvents.TouchUpInside)
      button.frame = CGRectMake(0, 0, 22.6, 17.3)
      let barButton = UIBarButtonItem(customView: button)
      self.navigationItem.leftBarButtonItem = barButton
      
      view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
      
    }
    
    // Load Banner.
    let banner = Banner(title: "We think you'll like this deal", subtitle: "Because we do...", image: UIImage(named: "tote_outline"), backgroundColor: UIColor(red:100.00/255.0, green:190.0/255.0, blue:224.0/255.0, alpha:1.000))
    banner.dismissesOnTap = false
    banner.dismissesOnSwipe = true
    banner.show(duration: 4.0)
    banner.delegate = self
    
  }
  
  func onTap() {
    // Push to the navigation stack a WebView VC with unique product URL.
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WebViewVC") as! WebViewController
    
    // URL pointing to single item store.
    vc.urlString = "https://clutch-store.herokuapp.com/#/c88e8a61-902f-4bd3-b175-3f7373c71a6e"
    
    self.navigationController!.pushViewController(vc, animated: true)
  }
  
}
