//
//  TabVlrViewController.swift
//  TabPageViewController
//
//  Created by MacBook on 3/24/18.
//

import UIKit
import  AZDialogView
import McPicker

import  DropDown
import JTAppleCalendar

class TabVlrViewController: UIViewController , UITabBarDelegate,UITableViewDataSource, CalendarPopUpDelegate{
    func dateChaged(date: Date) {
        
    }

    var listloai = ["Tháng","Quí","Năm"]
    
  
    @IBOutlet weak var mytableVlr: UITableView!
    @IBOutlet weak var btndoituong: UIButton!
    
    @IBAction func show_chon(_ sender: Any) {
        dropDownDoituong.show()
    }
    
    
    @IBAction func show_daypicker(_ sender: Any) {
        let xibView = Bundle.main.loadNibNamed("CalendarPopUp", owner: nil, options: nil)?[0] as! CalendarPopUp
        xibView.calendarDelegate = self
        xibView.selected = currentDate
        xibView.startDate = Calendar.current.date(byAdding: .month, value: -12, to: currentDate)!
        PopupContainer.generatePopupWithView(xibView).show()
    }
    
    var chon = 40
    var list=[BcvlrInfo]()
    var currentDate: Date! = Date() {
        didSet {
            setDate()
        }
    }
    
    let data: [[String]] = [["Năm 2018", "Năm 2017", "Năm 2016"]]
    
    
    @IBAction func show_search(_ sender: Any) {
        let dialog = AZDialogViewController(title: "Tìm kiém thông tin", message: "minitour")
        
        dialog.addAction(AZDialogAction(title: "Edit Name") { (dialog) -> (Void) in
            //add your actions here.
            McPicker.showAsPopover(data:self.data, fromViewController: self, sourceView: sender as! UIView, doneHandler: { [weak self] (selections: [Int : String]) -> Void in
                if let name = selections[0] {
                    //self?.btnnam.setTitle(name, for: .normal)
                    print("name \(name)")
                }
                }
            )
            dialog.dismiss()
        })
        
        dialog.show(in: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableVlr.rowHeight = 80
        mytableVlr.estimatedRowHeight = 140
        
         setupdoituong()
         getdata ()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupdoituong() -> Void {
        //5. Doi tuong
        dropDownDoituong.dataSource = listloai
        dropDownDoituong.anchorView = btndoituong // UIView or UIBarButtonItem
        dropDownDoituong.bottomOffset = CGPoint(x: 0, y: btndoituong.bounds.height)
        dropDownDoituong.selectionAction = { [unowned self] (index, item) in
            self.btndoituong.setTitle(item, for: .normal)
            
            let strDoituong=self.listloai[index]
            self.chon = index + 40
            print("chon: \(self.chon)")
            self.mytableVlr.reloadData()
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : CellVlr! = tableView.dequeueReusableCell(withIdentifier: "cellvlr") as! CellVlr
        if(cell == nil)
        {
            cell = Bundle.main.loadNibNamed("cellvlr", owner: self, options: nil)?[0] as! CellVlr;
        }
        
        cell.lbmuc.text = list[indexPath.row].donVi
        
        var bcth = list[indexPath.row]
        var myobj = Utils.getbyloai(items: bcth, loai: chon)
        
        cell.lbthuchien.text = myobj.thuchien
        cell.lbkehoach.text = myobj.kehoach
        cell.lbptram.text = myobj.phantram
        
        let fullNameArr = myobj.phantram.components(separatedBy: ".")
        
        let name    = fullNameArr[0]
        let surname = fullNameArr[1]
        let a:Int = Int(name)!
        if (a >= 100)
        {
            cell.lbptram.textColor = UIColor.green
        }
        else{
            cell.lbptram.textColor = UIColor.red
        }
        
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
