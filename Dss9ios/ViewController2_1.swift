//
//  ViewController2_1.swift
//  Dss9ios
//
//  Created by MacBook on 3/25/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class ViewController2_1: UIViewController , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath)
        cell.contentView.backgroundColor = UIColor.green
        let label = cell.viewWithTag(1) as! UILabel
        label.text = "\(indexPath.row)"
        return cell
    }
    

    @IBOutlet weak var page: UILabel!
    
    var pagenum = "page"
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
       // page.text = pagenum
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
   

}
