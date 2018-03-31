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
     func passingFilterBack(filter: FilterObj)
}

class SearchViewController: UIViewController {

    var proto: Protocol!
    var newfilter = FilterObj()
    
    @IBOutlet weak var btnnam: UIButton!
    
    @IBOutlet weak var btnthang: UIButton!
    
    @IBOutlet weak var btntinh: UIButton!
    
    @IBOutlet weak var btnloai: UIButton!
    
    @IBAction func huyclick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func xemclick(_ sender: Any) {
        //proto.passingDataBack(withString: "tessssss")
      
        proto.passingFilterBack(filter: newfilter)
        self.dismiss(animated: true, completion: nil)
    }
    
    let dataNam: [[String]] = [["2018", "2017", "2016"]]
     let dataThang: [[String]] = [["1", "2", "3","4","5", "6", "7","8","9", "10", "11","12"]]
    var dataTinh: [String] = [] //= [["Tất cả","An Giang", "Bạc Liêu", "Bến Tre","Cà Mau","Cần Thơ"]]
    let dataLoai: [[String]] = [["1","2"]]
    
    var listTinhobj = [TinhInfo]()
    
    @IBAction func show_nam(_ sender: Any) {
        McPicker.showAsPopover(data:dataNam, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnnam.setTitle(name, for: .normal)
                self?.newfilter.nam = name
                
                }
            }
           )
     
    }
    
    @IBAction func show_thang(_ sender: Any) {
        McPicker.showAsPopover(data:dataThang, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnthang.setTitle(name, for: .normal)
                self?.newfilter.thang = name
            }
            }
        )
    }
    
    
    @IBAction func show_tinh(_ sender: Any) {
        McPicker.showAsPopover(data:[dataTinh], fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btntinh.setTitle(name, for: .normal)
                
                
                let ind = self?.dataTinh.index(of: name)
                let tinh: TinhInfo = (self?.listTinhobj[ind!])!
                self?.newfilter.tinh = String(tinh.idTinh)
                print("id tinh = \(tinh.idTinh)")
            }
            }
        )
    }
    
   
    
    @IBAction func show_loai(_ sender: Any) {
        McPicker.showAsPopover(data:dataLoai, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnloai.setTitle(name, for: .normal)
                self?.newfilter.loai = name
            }
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getdataTinh ()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func getdataTinh ()
    {
        guard  let url_bcth = URL(string: "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=40&userid=7592&ms_phongban=620&mucquyen=4&istrungtam=1")
            else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url_bcth) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                let tinhobj = try JSONDecoder().decode(TinhObj.self, from: data)
                
                DispatchQueue.main.async {
                    print("size tinh from server: \(tinhobj.tinhInfo.count)")
                    self.dataTinh = Utils.gettentinh(list: tinhobj.tinhInfo)
                     print("size tinh: \(self.dataTinh.count)")
                    self.listTinhobj = tinhobj.tinhInfo
                 
                    
                }
            } catch {
                print("error")
            }
        }
        task.resume()
        
    }

  

}
