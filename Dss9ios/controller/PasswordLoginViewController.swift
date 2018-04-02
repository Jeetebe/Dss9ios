//
//  PasswordLoginViewController.swift
//  SmileLock-Example
//
//  Created by rain on 4/22/16.
//  Copyright © 2016 RECRUIT LIFESTYLE CO., LTD. All rights reserved.
//

import UIKit
import SmileLock

class PasswordLoginViewController: UIViewController {

    @IBOutlet weak var passwordStackView: UIStackView!
    
    //MARK: Property
    var passwordContainerView: PasswordContainerView!
    let kPasswordDigit = 4
    var otp = ""
    var taikhoan = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create PasswordContainerView
        passwordContainerView = PasswordContainerView.create(in: passwordStackView, digit: kPasswordDigit)
        passwordContainerView.delegate = self
        passwordContainerView.deleteButtonLocalizedTitle = "Xoá"
        
        //customize password UI
        passwordContainerView.tintColor = UIColor.gray
        passwordContainerView.highlightedColor = UIColor.blue
    }
}

extension PasswordLoginViewController: PasswordInputCompleteProtocol {
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        if validation(input) {
            validationSuccess()
        } else {
            validationFail()
        }
    }
    
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
        if success {
            self.validationSuccess()
        } else {
            passwordContainerView.clearInput()
        }
    }
}

private extension PasswordLoginViewController {
    func validation(_ input: String) -> Bool {
        return input == otp
    }
    
    func validationSuccess() {
        print("*️⃣ success!")
        
        
        var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vc : ViewController = storyboard.instantiateViewController(withIdentifier: "mainview") as! ViewController
        
        UserDefaults.standard.setValue(true, forKey: "islogin")
        UserDefaults.standard.setValue(taikhoan, forKey: "taikhoan")
        
        self.present(vc, animated: true, completion: nil)
       
    }
    
    func validationFail() {
        print("*️⃣ failure!")
        passwordContainerView.wrongPassword()
    }
}
