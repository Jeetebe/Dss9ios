//
//  SearchViewController.swift
//  Dss9ios
//
//  Created by MacBook on 3/26/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import McPicker

protocol Protocol {
    func passingDataBack(withString: String)
    
}
class SearchViewController: UIViewController {

    var proto: Protocol!
    var filter: FilterObj!
    
    @IBOutlet weak var btnnam: UIButton!
    
    @IBOutlet weak var btnthang: UIButton!
    
    @IBOutlet weak var btntinh: UIButton!
    
    @IBOutlet weak var btnloai: UIButton!
    
    @IBAction func huyclick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func xemclick(_ sender: Any) {
        proto.passingDataBack(withString: "tessssss")
        self.dismiss(animated: true, completion: nil)
    }
    
    let dataNam: [[String]] = [["Năm 2018", "Năm 2017", "Năm 2016"]]
     let dataThang: [[String]] = [["Tháng 1", "Tháng 2", "Tháng 3","Tháng 4"]]
    let dataTinh: [[String]] = [["Tất cả","An Giang", "Bạc Liêu", "Bến Tre","Cà Mau","Cần Thơ"]]
    let dataLoai: [[String]] = [["1","2"]]
    
    @IBAction func show_nam(_ sender: Any) {
        McPicker.showAsPopover(data:dataNam, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnnam.setTitle(name, for: .normal)
                }
            }
           )
     
    }
    
    @IBAction func show_thang(_ sender: Any) {
        McPicker.showAsPopover(data:dataThang, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnthang.setTitle(name, for: .normal)
            }
            }
        )
    }
    
    
    @IBAction func show_tinh(_ sender: Any) {
        McPicker.showAsPopover(data:dataTinh, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btntinh.setTitle(name, for: .normal)
            }
            }
        )
    }
    
   
    
    @IBAction func show_loai(_ sender: Any) {
        McPicker.showAsPopover(data:dataLoai, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnloai.setTitle(name, for: .normal)
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
