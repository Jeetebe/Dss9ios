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

class TabVlrViewController: UIViewController , UITabBarDelegate,UITableViewDataSource, CalendarPopUpDelegate, Protocol{
    func dateChaged(date: Date) {
        chon = testCalendar.component(.day, from: date)
        
        print("chon \(chon)")
        DispatchQueue.main.async {
            self.mytableVlr.reloadData()
        }
    }
    func passingDataBack(withString: String) {
        //
        print("back \(withString)")
    }
    
    func passingFilterBack(filter: FilterObj) {
        //
        print("back filter\(filter.nam)")
        self.myFilter = filter
        self.getdata()
        DispatchQueue.main.async {
            self.mytableVlr.reloadData()
        }
    }

    let dropDownDoituong = DropDown()
    var listloai = ["Tháng","Quí","Năm"]
    var testCalendar = Calendar(identifier: .gregorian)
    var myFilter:FilterObj!
    
    var mydate: MyDateObj!
  
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
    
    func setDate() {
        let month = testCalendar.dateComponents([.month], from: currentDate).month!
        let weekday = testCalendar.component(.weekday, from: currentDate)
        let monthName = DateFormatter().monthSymbols[(month-1) % 12] //GetHumanDate(month: month)//
        let week = DateFormatter().shortWeekdaySymbols[weekday-1]
        
        let day = testCalendar.component(.day, from: currentDate)
        let year = testCalendar.component(.year, from: currentDate)
        
        
        
        mydate = MyDateObj (nam: String(year),thang: String(month),ngay: String(day))
        //dateLabel.text = "\(week), " + monthName + " " + String(day)
    }
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
        
        setDate()
        myFilter = FilterObj(nam: mydate.nam, thang: mydate.thang, tinh: "-1",tentinh: "Công ty", loai: "-1", ngay: "40", tab: -1)
         //setupdoituong()
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
        var myobj = Utils.getbyloai_vlr(items: bcth, loai: chon)
        
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
        if segue.identifier == "gofilter"
        {
            let vc = segue.destination as? SearchViewController
            vc?.tab = 1
            vc?.proto = self //This line will instantiate the protocol to our ViewController class
        }
    }
    
    func getdata ()
    {
        
        if myFilter.loai == "-1"
        {
            myFilter.loai = "VLR"
        }
        let url_vlr = "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=111&userid=7592&ms_phongban=620&mucquyen=4&istrungtam=1&thang="+myFilter.thang+"&nam="+myFilter.nam+"&idtinh="+myFilter.tinh+"&loai=" + myFilter.loai
        print("url vlr\(url_vlr)")
        guard  let url = URL(string: url_vlr)
            
            else {
                return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                let bcth = try JSONDecoder().decode(BcvlObj.self, from: data)
                //et user = User(data)
                //print(user.userInfo.tendangnhap)
                DispatchQueue.main.async {
                    self.list = bcth.bcvlrInfo
                    self.mytableVlr.reloadData()
                    
                    self.listloai.removeAll()
                    self.listloai.append("Tháng " + String(bcth.bcvlrInfo[0].thang))
                    self.listloai.append("Quí " + String(bcth.bcvlrInfo[0].quy))
                    self.listloai.append("Năm " + String(bcth.bcvlrInfo[0].nam))
                    self.setupdoituong()
                }
            } catch {
                print("error getdata")
            }
        }
        task.resume()
        
    }
    override func shouldPerformSegue(withIdentifier identifier: String?, sender: Any?) -> Bool {
        if let ident = identifier {
            if ident == "chontinh" {
                if let indexPath = self.mytableVlr.indexPathForSelectedRow {
                    print("row \(indexPath.row)")
                    var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    var vc : LineChart1ViewController = storyboard.instantiateViewController(withIdentifier: "LineChart1ViewController") as! LineChart1ViewController
                    vc.row=indexPath.row;
                    let ten = self.list[indexPath.row].donVi
                    //self.myFilter.tinh = ten
                    vc.ten = ten
                    vc.myFilter = self.myFilter
                    vc.tab = 1
                    
                    self.present(vc, animated: true, completion: nil)
                    
                }
                
            }
            else if ident == "showpie"
            {
                print("show pie")
                var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                var vc : PieChartViewController = storyboard.instantiateViewController(withIdentifier: "PieChartViewController") as! PieChartViewController
                vc.myFilter = self.myFilter
                vc.tab = 1
                
                self.present(vc, animated: true, completion: nil)
            }
        }
        return true
    }


}
