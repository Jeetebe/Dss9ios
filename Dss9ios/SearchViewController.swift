//
//  SearchViewController.swift
//  Dss9ios
//
//  Created by MacBook on 3/26/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import McPicker

class SearchViewController: UIViewController {

    
    @IBOutlet weak var btnnam: UIButton!
    
    let data: [[String]] = [["Năm 2018", "Năm 2017", "Năm 2016"]]
    
    @IBAction func show_nam(_ sender: Any) {
        McPicker.showAsPopover(data:data, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnnam.setTitle(name, for: .normal)
                }
            }
           )
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
