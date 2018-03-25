

import UIKit
import  DropDown

class TableViewController: UIViewController {
    
    @IBOutlet weak var myTableview: UITableView!
    
    
     let dropDownDoituong = DropDown()
     var listloai = ["Tháng","Quí","Năm"]
    
     var list=[BcthInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
       
       // setupdoituong()
        getdata ()
    }
   
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setupdoituong() -> Void {
        //5. Doi tuong
        dropDownDoituong.dataSource = listloai
        //dropDownDoituong.anchorView = btnthangquinam // UIView or UIBarButtonItem
        //dropDownDoituong.bottomOffset = CGPoint(x: 0, y: btnthangquinam.bounds.height)
        dropDownDoituong.selectionAction = { [unowned self] (index, item) in
            //self.btnthangquinam.setTitle(item, for: .normal)
            
            let strDoituong=self.list[index]
            print("chon: \(strDoituong)")
          
        }
    }
    
    func numberOfSectionsInTableView(_ tableView: UITableView) -> Int
    {
        return 1
    }

    func tableView(_ tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return list.count
    }
    

       func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    {
        var cell : CellBcth! = tableView.dequeueReusableCell(withIdentifier: "cell") as! CellBcth
        if(cell == nil)
        {
            cell = Bundle.main.loadNibNamed("cell", owner: self, options: nil)?[0] as! CellBcth;
        }
     
        cell.lbmuc.text = list[indexPath.row].donVi
        cell.lbthuchien.text = list[indexPath.row].thucHienThang
        cell.lbkehoach.text = list[indexPath.row].keHoachThang
        cell.lbptram.text = list[indexPath.row].phanTramThucHienThang
        cell.lbloai.text = list[indexPath.row].tenNhom


        return cell as CellBcth
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
    
        guard let url = URL(string: "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=1&username=duy.tranba&password=duytb830225&smartphone_id=68c8-2f00-8374-858c&IMEI=&Model_Number=Samsung%20SM-J510FN&Phone_Number=") else { return }
        
        guard  let url_bcth = URL(string: "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=108&userid=7592&ms_phongban=620&mucquyen=4&istrungtam=1&thang=03&nam=2018&idtinh=-1&loai=3") else {
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url_bcth) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                let bcth = try JSONDecoder().decode(BcthObj.self, from: data)
                //et user = User(data)
                //print(user.userInfo.tendangnhap)
                DispatchQueue.main.async {
                    self.list = bcth.bcthInfo
                    self.myTableview.reloadData()
                }
            } catch {
                print("error")
            }
        }
        task.resume()
    
    }
}
