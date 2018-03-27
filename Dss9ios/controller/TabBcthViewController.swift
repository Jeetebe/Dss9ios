//
//  TabBcthViewController.swift
//  Dss9ios
//
//  Created by MacBook on 3/25/18.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import  DropDown
import JTAppleCalendar


class TabBcthViewController: UIViewController, UITabBarDelegate,UITableViewDataSource , CalendarPopUpDelegate{
    func dateChaged(date: Date) {
        
    }
    

    
    @IBOutlet weak var mytableBcth: UITableView!
    
    @IBOutlet weak var btndoituong: UIButton!
    let dropDownDoituong = DropDown()
    
    var aPopupContainer: PopupContainer?
    var testCalendar = Calendar(identifier: .gregorian)
    
    var list=[BcthInfo]()
    var listloai = ["Tháng","Quí","Năm"]
    var chon = 40
    
    var currentDate: Date! = Date() {
        didSet {
            setDate()
        }
    }
    
    
    @IBAction func show_daypicker(_ sender: Any) {
        let xibView = Bundle.main.loadNibNamed("CalendarPopUp", owner: nil, options: nil)?[0] as! CalendarPopUp
        xibView.calendarDelegate = self
        xibView.selected = currentDate
        xibView.startDate = Calendar.current.date(byAdding: .month, value: -12, to: currentDate)!
        PopupContainer.generatePopupWithView(xibView).show()
    }
    
    @IBAction func show_chon(_ sender: Any) {
        dropDownDoituong.show()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mytableBcth.rowHeight = 130
        mytableBcth.estimatedRowHeight = 140
        
        setupdoituong()
        getdata ()
        
        currentDate = Date()
        
    }
    func setDate() {
        let month = testCalendar.dateComponents([.month], from: currentDate).month!
        let weekday = testCalendar.component(.weekday, from: currentDate)
        let monthName = DateFormatter().monthSymbols[(month-1) % 12] //GetHumanDate(month: month)//
        let week = DateFormatter().shortWeekdaySymbols[weekday-1]
        
        let day = testCalendar.component(.day, from: currentDate)
        
        //dateLabel.text = "\(week), " + monthName + " " + String(day)
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
            self.mytableBcth.reloadData()
            
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var cell : CellBcth! = tableView.dequeueReusableCell(withIdentifier: "cellbcth") as! CellBcth
        if(cell == nil)
        {
            cell = Bundle.main.loadNibNamed("cellbcth", owner: self, options: nil)?[0] as! CellBcth;
        }
        
        cell.lbmuc.text = list[indexPath.row].donVi
        cell.lbloai.text = list[indexPath.row].tenNhom
        
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
        
        
        return cell as CellBcth
    }


    
    func getdata ()
    {
        guard  let url_bcth = URL(string: "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=108&userid=7592&ms_phongban=620&mucquyen=4&istrungtam=1&thang=03&nam=2018&idtinh=-1&loai=3") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url_bcth) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                let bcth = try JSONDecoder().decode(BcthObj.self, from: data)
        
                DispatchQueue.main.async {
                    print("size: \(self.list.count)")
                    self.list = bcth.bcthInfo
                    self.mytableBcth.reloadData()
                }
            } catch {
                print("error")
            }
        }
        task.resume()
        
    }

}
extension ViewController: CalendarPopUpDelegate {
    func dateChaged(date: Date) {
        //currentDate = date
    }
}
