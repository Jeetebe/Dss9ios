//
//  TaikhoanViewController.swift
//  Dss9ios
//
//  Created by Tran Ba Duy on 2/4/2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class TaikhoanViewController: UIViewController {

    
    @IBAction func logoutClick(_ sender: Any) {
        var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vc : LoginViewController = storyboard.instantiateViewController(withIdentifier: "login") as! LoginViewController
        //vc.taikhoan=taikhoan;
        UserDefaults.standard.setValue(false, forKey: "islogin")
        UserDefaults.standard.setValue("", forKey: "taikhoan")
        self.present(vc, animated: true, completion: nil)
        
    }
    
    var userinfo: UserInfo!
    
    @IBOutlet weak var lbten: UILabel!
    
    @IBOutlet weak var lbphongban: UILabel!
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tendangnhap=UserDefaults.standard.string(forKey: "tendangnhap")
        let tenphongban=UserDefaults.standard.string(forKey: "tenphongban")
        
        lbten.text = tendangnhap
        lbphongban.text = tenphongban

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
