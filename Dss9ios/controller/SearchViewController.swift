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
    var tab: Int!
    
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
    var dataLoai: [[String]] = [[]]
    
    
    let tl_vlr = ["Thuê Bao VLR","Thuê Bao 3K3D VLR","Thuê Bao VLR - Bật Máy","Thuê Bao VLR - 3G","Thuê Bao VLR - 4G"]
    let tlk_vlr = ["VLR","VLR_3K3D","VLR_BatMay","VLR_3G","VLR_4G"]
    
    let tl_dttt = ["DTTT theo DV",
                   
                   "DTTT theo DV (TT)","DTTT theo DV (TS)",
                   
                   "DTTT Chi nhánh (TT)","DTTT Chi nhánh (TS)","DTTT Chi nhánh (TT+TS)","DTTT Chi nhánh (KHCN)","DTTT Chi nhánh (KHDN-TS)","DTTT Chi nhánh (KHDN-TT)"]
    let tlk_dttt = ["1","2","3","4","5","6","7","8","9"]
    
    
    
    
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
                self?.newfilter.tentinh = name.replacingOccurrences(of: "Tất cả", with: "Công ty")
                print("id tinh = \(tinh.idTinh)")
            }
            }
        )
    }
    
   
    
    @IBAction func show_loai(_ sender: Any) {
        McPicker.showAsPopover(data:dataLoai, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
            if let name = selections[0] {
                self?.btnloai.setTitle(name, for: .normal)
                var loai = ""
                switch tab {
                case 1:
                    let ind = self?.tl_vlr.index(of: name)
                    loai = self?.tlk_vlr[ind!]
                    
                case 2:
                    let ind = self?.tl_dttt.index(of: name)
                    loai = self?.tlk_dttt[ind!]
                    
                default:
                    return
                }
                self?.newfilter.loai = loai!
               
                
            }
            }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("tab \(tab)")
        
        getdataTinh ()
        switch tab {
        case 1:
             dataLoai = [tl_vlr]
        case 2:
            dataLoai = [tl_dttt]
        default:
             dataLoai = [tl_vlr]
        }
       
        
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
                    self.listTinhobj = tinhobj.tinhInfo
                    let congty = TinhInfo(idTinh: -1, codeTinh : "-1", tenTinh: "Công ty", flag: true)
                    
                    self.listTinhobj.append(congty)
                    self.dataTinh = Utils.gettentinh(list: self.listTinhobj)
                    print("size tinh: \(self.dataTinh.count)")
                 
                    
                }
            } catch {
                print("error")
            }
        }
        task.resume()
        
    }

  

}
