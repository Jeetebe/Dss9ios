//
//  TabVlrViewController.swift
//  Dss9ios
//
//  Created by MacBook on 3/25/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import DropDown

class TabVlrViewController: UIViewController {

     var list=[BcvlrInfo]()
    
    
    @IBOutlet weak var mytableVlr: UITableView!
    
     let dropDown = DropDown()
    @IBOutlet weak var btnDropdown: UIButton!
    
    @IBAction func show_chon(_ sender: Any) {
       dropDown.show()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        // The view to which the drop down will appear on
        dropDown.anchorView = btnDropdown // UIView or UIBarButtonItem
        
        // The list of items to display. Can be changed dynamically
        dropDown.dataSource = ["Tháng", "Quí", "Năm"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
        }
        
        mytableVlr.rowHeight = 100
        mytableVlr.estimatedRowHeight = 140
        
        print("getdata")
        getdata ()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        //return list.count
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        var cell : CellVlr! = tableView.dequeueReusableCell(withIdentifier: "cellvlr") as! CellVlr
        if(cell == nil)
        {
            cell = Bundle.main.loadNibNamed("cellvlr", owner: self, options: nil)?[0] as! CellVlr;
        }
        
        cell.lbmuc.text = list[indexPath.row].donVi
        cell.lbthuchien.text = list[indexPath.row].thucHienThang
        cell.lbkehoach.text = list[indexPath.row].keHoachThang
        cell.lbptram.text = list[indexPath.row].phanTramThucHienThang
        
        
        return cell as CellVlr
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DetailSegue"
        {
            //            let detailViewController = ((segue.destination) as! WebviewController)
            //
            //            let indexPath = self.myTableview!.indexPathForSelectedRow!
            //            let tinhobj = list[indexPath.row]
            //                      detailViewController.tinhobj=tinhobj
        }
    }
    
    func getdata ()
    {
        
        guard  let url_vlr = URL(string: "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=111&userid=7592&ms_phongban=620&mucquyen=4&istrungtam=1&thang=03&nam=2018&idtinh=-1&loai=VLR") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url_vlr) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                let bcth = try JSONDecoder().decode(BcvlObj.self, from: data)
                //et user = User(data)
                //print(user.userInfo.tendangnhap)
                DispatchQueue.main.async {
                    print("size lise \(self.list.count)")
                    self.list = bcth.bcvlrInfo
                    self.mytableVlr.reloadData()
                }
            } catch {
                print("error getdata")
            }
        }
        task.resume()
        
    }


}
