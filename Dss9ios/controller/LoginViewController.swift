//
//  LoginViewController.swift
//  Dss9ios
//
//  Created by Tran Ba Duy on 1/4/2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit
import  AZDialogView
import  Alamofire

class LoginViewController: UIViewController {

    
    var user:UserInfo!
    var mydialog:AZDialogViewController!
    
    @IBOutlet weak var txtuser: UITextField!
    
    @IBOutlet weak var txtpass: UITextField!
    
    
    @IBAction func login_click(_ sender: Any) {
        getdata ()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        definesPresentationContext = true
        
         donebutton(to: txtuser)
         donebutton(to: txtpass)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func present1(_ id: String, otp: String, taikhoan:String) {
        //self.dismiss(animated: false, completion: nil)
        var loginVC:PasswordLoginViewController = storyboard?.instantiateViewController(withIdentifier: id) as! PasswordLoginViewController
        loginVC.otp = otp
        loginVC.taikhoan = taikhoan
        loginVC.modalPresentationStyle = .overCurrentContext
        
        if presentedViewController == nil {
            self.present(loginVC, animated: true, completion: nil)
        } else{
            self.dismiss(animated: false) { () -> Void in
                self.present(loginVC, animated: true, completion: nil)
            }
        }
        
       
        
      
    }
    func getdata ()
    {
       
        var systemVersion = "systemVersion"//UIDevice.current.systemVersion
        //print("systemVersion" + systemVersion)
        
        let modelName = "modelName"//UIDevice.current.model
        //print("modelName" + modelName)
        
        let url_vlr = "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=1&username=duy.tranba&password=duytb830225&smartphone_id=68c8-2f00-8374-858c&IMEI=&Model_Number=Samsung%20SM-J510FN&Phone_Number="
        
       // self.user.username = txtuser.text!
        //self.user.password = txtpass.text!
        
//        let url_login = "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=1&username="+self.user.username+"&password="+self.user.password+"&smartphone_id=68c8-2f00-8374-858c&IMEI=&Model_Number=123&Phone_Number=123"
         let url_login = "http://www.simmobi.vn:8090/QLCVMobiWebService/wsqlcv?cmd=1&username="+txtuser.text!+"&password="+txtpass.text!+"&smartphone_id=68c8-2f00-8374-858c&IMEI=&Model_Number=123&Phone_Number=123"
        
        print("url vlr:\(url_login)")
        guard  let url = URL(string: url_login)
            
            else {
                 print("loi url")
                return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            print(data)
            do {
                let obj = try JSONDecoder().decode(User.self, from: data)
                if (obj.success)
                {
                    print("thanh cong")
                    self.user = obj.userInfo
                    
                     UserDefaults.standard.setValue(self.user.userID, forKey: "userid")
                     UserDefaults.standard.setValue(self.user.tendangnhap, forKey: "tendangnhap")
                    UserDefaults.standard.setValue(self.user.tenphongban, forKey: "tenphongban")
                    
                    self.mydialog = AZDialogViewController(title: "Thành công ", message: "Xin chào \(self.user.tendangnhap) , mã OTP sẽ gởi đến SĐT \(self.user.msbophan)")
                    
                    self.mydialog.addAction(AZDialogAction(title: "Tiếp tục") { (dialog) -> (Void) in
                        //add your actions here.
                        self.mydialog.dismiss()
                        self.alamofirePost(isdn: String(self.user.msbophan))
                        
                       
                    })
                    
                    self.mydialog.show(in: self)
                }
                else
                {
                    print("that bai")
                    self.mydialog = AZDialogViewController(title: "Thông báo ", message: "Đăng nhập thất bại")
                    
                    self.mydialog.addAction(AZDialogAction(title: "Đóng") { (dialog) -> (Void) in
                        //add your actions here.
                        
                        self.mydialog.dismiss()
                    })
                    
                    self.mydialog.show(in: self)
                }
                
                DispatchQueue.main.async {
                   
                }
            } catch {
                print("error getdata")
                //print("that bai")
                let dialog = AZDialogViewController(title: "Thông báo ", message: "Đăng nhập thất bại")
                
                dialog.addAction(AZDialogAction(title: "Đóng") { (dialog) -> (Void) in
                    //add your actions here.
                    
                    self.mydialog.dismiss()
                })
                
                dialog.show(in: self)
            }
        }
        task.resume()
        
    }
    func alamofirePost(isdn:String) {
        let todosEndpoint: String = "http://123.30.100.120:6789/FileUploaderRESTService/rest/dktttb/getcodeotp"
        let newTodo: [String: Any] = ["phone": isdn,"imei":"uuid"]
        Alamofire.request(todosEndpoint, method: .post, parameters: newTodo, encoding: JSONEncoding.default)
            .responseJSON { response in
                guard response.result.error == nil else {
                    // got an error in getting the data, need to handle it
                    print("error calling POST on /todos/1")
                    print(response.result.error!)
                    return
                }
                // make sure we got some JSON since that's what we expect
                guard let json = response.result.value as? [String: Any] else {
                    print("didn't get todo object as JSON from API")
                    print("Error: \(response.result.error)")
                    return
                }
                // get and print the title
                guard let code = json["code"] as? String else {
                    print("Could not get todo title from JSON")
                    return
                }
                 DispatchQueue.main.async {
                    print("The code is: " + code)
                    self.mydialog.dismiss()
                    self.present1("PasswordLoginViewController", otp: code, taikhoan: String(self.user.msbophan))
                }
                
                
        }
    }

}
extension UIViewController {
    func donebutton(to control: UITextField) {
        let toolbar = UIToolbar()
        toolbar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil),
            UIBarButtonItem(title: "X", style: .done, target: control, action: #selector(UITextField.resignFirstResponder))
        ]
        toolbar.sizeToFit()
        control.inputAccessoryView = toolbar
    }
   
}
