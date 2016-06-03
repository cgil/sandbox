//
//  PhotoViewController.swift
//  SidebarMenu
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
      
      // Reveal menu on swipe.
      view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    // Load Banner.
    let banner = Banner(title: "We think you'll like this deal", subtitle: "Because we do...", image: UIImage(named: "tote_outline"), backgroundColor: UIColor(red:217.00/255.0, green:88.0/255.0, blue:87.0/255.0, alpha:1.000))
    banner.dismissesOnTap = false
    banner.dismissesOnSwipe = true 
    banner.show(duration: 5.0)
    banner.delegate = self
    
  }
  
  func onTap() {
    // Push to the navigation stack a WebView VC with unique product URL.
    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WebViewVC") as! WebViewController
    
    // URL pointing to single item store.
    vc.urlString = "https://clutch-store.herokuapp.com/"
    
    self.navigationController!.pushViewController(vc, animated: true)
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
