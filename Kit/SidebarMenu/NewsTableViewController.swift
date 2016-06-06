//
//  NewsTableViewController.swift
//  Kit
//
//  Created by Andy Miller on 5/23/16.
//  Copyright © 2016 Tote. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
  
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
    
  }
  
  // MARK: - Table view data source
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // Return the number of sections.
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // Return the number of rows in the section.
    return 3
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! NewsTableViewCell
    
    // Configure the cell...
    if indexPath.row == 0 {
      cell.postImageView.image = UIImage(named: "inky")
      cell.postTitleLabel.text = "New Zealand Aquarium Octopus Has Flown The Coop"
      cell.authorLabel.text = "Jane Doe"
      cell.authorImageView.image = UIImage(named: "userpic")
      
    } else if indexPath.row == 1 {
      cell.postImageView.image = UIImage(named: "ecoaquarium")
      cell.postTitleLabel.text = "Self contained biospheres make great aquariums! Click to buy."
      cell.authorLabel.text = "Kit"
      cell.authorImageView.image = UIImage(named: "Kit")
      
    } else {
      cell.postImageView.image = UIImage(named: "whaleshark")
      cell.postTitleLabel.text = "Whale Shark Does Barrel Roll to Avoid Sea Turtle Off Australia's Gold Coast"
      cell.authorLabel.text = "Jane Doe"
      cell.authorImageView.image = UIImage(named: "userpic")
      
    }
    
    return cell
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if (indexPath.row == 1) {
      
      // Push to the navigation stack a WebView VC with unique product URL.
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("WebViewVC") as! WebViewController
      
      // URL pointing to single item store.
      vc.urlString = "https://clutch.totestore.com/#/c88e8a61-902f-4bd3-b175-3f7373c71a6e"
      
      self.navigationController!.pushViewController(vc, animated: true)
      
    }
  }
  
}
