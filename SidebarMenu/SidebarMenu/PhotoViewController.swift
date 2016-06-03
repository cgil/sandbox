//
//  PhotoViewController.swift
//  SidebarMenu
//
//  Created by Andy Miller on 5/23/16.
//  Copyright © 2016 Tote. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

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
