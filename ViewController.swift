//
//  ViewController.swift
//  System-Task
//
//  Created by apple on 6/24/20.
//  Copyright © 2020 apple. All rights reserved.
//

import UIKit
import IQKeyboardManager

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginbtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.emailTF.delegate = self
        self.passwordTF.delegate = self
        self.loginbtn.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    @objc func login(){
        if emailTF.text == "t test@gmail.com" && passwordTF.text == "admin1234"{
            let delete = UIAlertAction(title: "Yes", style: .destructive, handler: { _ in
                let vc = self.storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
                self.navigationController?.pushViewController(vc, animated: true)
            })
               let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

               presentAlert(title: "", message: "login Sucessfully", actions: delete, cancel)
        }
        else{
           let delete = UIAlertAction(title: "Yes", style: .destructive, handler: { _ in /* Your code here */})
              let cancel = UIAlertAction(title: "Cancel", style: .default, handler: nil)

              presentAlert(title: "", message: "Invalid Credentails", actions: delete, cancel)
        }
        
    }
   


}

extension UIViewController {

    func presentAlert(title: String?, message: String, actions: UIAlertAction..., animated: Bool = true) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        self.present(alert, animated: animated, completion: nil)
    }

    func presentActionSheet(title: String?, message: String, actions: UIAlertAction..., animated: Bool = true) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        actions.forEach { alert.addAction($0) }
        self.present(alert, animated: animated, completion: nil)
    }
}
