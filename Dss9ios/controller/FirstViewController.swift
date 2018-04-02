//
//  FirstViewController.swift
//  Dss9ios
//
//  Created by Tran Ba Duy on 1/4/2018.
//  Copyright © 2018 MacBook. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    var islogin:Bool=false
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if (UserDefaults.standard.value(forKey: "islogin") != nil)
        {
            islogin=UserDefaults.standard.bool(forKey: "islogin")
        }
        if (islogin)
        {
            go_main()
        }
        else
        {
            go_login()
        }
    }
   

    func go_login() {
        var loginVC:LoginViewController = storyboard?.instantiateViewController(withIdentifier: "login") as! LoginViewController
        
        loginVC.modalPresentationStyle = .overCurrentContext
        present(loginVC, animated: true, completion: nil)
    }
    func go_main() {
        var loginVC:ViewController = storyboard?.instantiateViewController(withIdentifier: "mainview") as! ViewController
     
        loginVC.modalPresentationStyle = .overCurrentContext
        present(loginVC, animated: true, completion: nil)
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
