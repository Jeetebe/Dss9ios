//
//  ViewController.swift
//  Dss9ios
//
//  Created by MacBook on 3/25/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import TabPageViewController


class ViewController: UIViewController {
    
    
    var userinfo: UserInfo!
    
    let bg = #colorLiteral(red: 0.2447162889, green: 0.3756026192, blue: 0.6181792422, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tc = TabPageViewController.create()
        //let vc1 = storyboard?.instantiateViewController(withIdentifier: "tabbcth") as! TableViewController
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "tabbcth") as! TabBcthViewController
        
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "tabvlr") as! TabVlrViewController
       
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "tabdttt") as! TabDtttViewController
       
//        let vc4 = storyboard?.instantiateViewController(withIdentifier: "tabdtbh") as! TabDtbhViewController
//
//        let vc5 = storyboard?.instantiateViewController(withIdentifier: "tabptm") as! TabPtmViewController
//
//        let vc6 = storyboard?.instantiateViewController(withIdentifier: "tabll") as! TabLLViewController
        
        
//        tc.tabItems = [(vc1, "Home"), (vc2, "VLR"), (vc3, "DTTT"), (vc4, "DTBH"), (vc5, "PTM"), (vc6, "LL")]
          tc.tabItems = [(vc1, "Home"), (vc2, "VLR"), (vc3, "DTTT")]
        
        
        //tc.displayControllerWithIndex(1, direction: .forward, animated: false)
        
        var option = TabPageOption()
        option.currentColor = UIColor.white
        option.tabBackgroundColor = bg
        option.tabWidth = view.frame.width / CGFloat(tc.tabItems.count)
        tc.option = option
        //self.navigationItem.title = "テスト"
        
        self.addChildViewController(tc)
        self.view.addSubview(tc.view)
        tc.didMove(toParentViewController: self)
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

