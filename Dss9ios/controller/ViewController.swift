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
    
    
    let bg = #colorLiteral(red: 0.1839655188, green: 0.3066258651, blue: 0.6912443329, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tc = TabPageViewController.create()
        //let vc1 = storyboard?.instantiateViewController(withIdentifier: "tabbcth") as! TableViewController
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "tabbcth") as! TabBcthViewController
        //vc1.view.backgroundColor = UIColor.blue
        //vc1.page.text = "page1"
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "tabvlr") as! TabVlrViewController
        //vc2.view.backgroundColor = UIColor.yellow
        //vc2.page.text = "page2"
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "2_1") as! ViewController2_1
        //vc3.view.backgroundColor = UIColor.green
        //vc3.page.text = "page3"
        
        tc.tabItems = [(vc1, "Home"), (vc2, "VLR"), (vc3, "Third")]
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

