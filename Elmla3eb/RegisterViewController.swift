//
//  ViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 10/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController , UITextFieldDelegate {
   


    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var retypePasswordTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var birthDateTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var neighborTF: UITextField!
    
    let registerTFDelegate = RegisterTextFieldDeledate()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstNameTF.delegate = registerTFDelegate
        emailTF.delegate = registerTFDelegate
        passwordTF.delegate = registerTFDelegate
        retypePasswordTF.delegate = registerTFDelegate
        phoneNumberTF.delegate = registerTFDelegate
        birthDateTF.delegate = self
        cityTF.delegate = registerTFDelegate
        neighborTF.delegate = registerTFDelegate
      
        

        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func datePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        birthDateTF.text = formatter.string(from: sender.date)
            }
   
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == birthDateTF {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = UIDatePickerMode.date
            datePicker.maximumDate = Calendar.current.date(byAdding: .year, value: -16, to: Date())
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(RegisterViewController.datePickerChanged(_:)), for: .valueChanged)
        }
    }

    func closekeyboard() {
        self.view.endEditing(true)
    }

    
    func checktextValid()-> (String , Bool) {
        
        guard let name = firstNameTF.text , name.characters.count >= 6  else {
            return ("الإسم يجب ان يكون اكثر من ٦ أحرف" ,  false )
        }
        guard let email = emailTF.text , email.characters.count >= 6 , email.contains("@") else {
            return ("صيغة الإيميل غير صحيحة" ,  false )
        }
        guard let password = passwordTF.text , password.characters.count >= 6 else {
            return ("كلمة المرور يجب ان تكون اكثر من ٦ احرف" ,  false )
        }
        guard let password2 = retypePasswordTF.text , password2.characters.count >= 6 else {
            return ("كلمة المرور يجب ان تكون اكبر من ٦ احرف" ,  false )
        }
        guard let phoneNum = phoneNumberTF.text , phoneNum.characters.count >= 12 else {
            return (" يجب ان يحتوى الرقم علي ١٢ رقم" ,  false )
        }
        guard let birthdate = birthDateTF.text , birthdate.characters.count >= 5 else {
            return ("خانة تاريخ الميلاد فارغه!!" ,  false )
        }
        guard let city = cityTF.text , city.characters.count >= 2 else {
            return ("من فضلك ادخل المدينة" ,  false )
        }
        guard let neighbor = neighborTF.text , neighbor.characters.count >= 6 else {
            return ("من فضلك ادخل المنطقة" ,  false )
        }
        guard  password == password2 else {
            return ("كلمت السر غير مطابقة" ,  false )
        }
        return ("مرحباً بك فى الملاعب",true)
        
        
    }
    
    @IBAction func signUpBtnAct(_ sender: UIButton) {
        let checker = checktextValid()
        if checker.1 {
            let alert = FCAlertView(type: .success)
            
            alert.showAlert(inView: self,
                            withTitle: "تم التسجيل بنجاح",
                            withSubtitle: checker.0,
                            withCustomImage: nil,
                            withDoneButtonTitle: nil,
                            andButtons: nil)
        }else {
            let alert = FCAlertView(type: .warning)
        
            alert.showAlert(inView: self,
                            withTitle: "خطأ فى التسجيل",
                            withSubtitle: checker.0,
                            withCustomImage: nil,
                            withDoneButtonTitle: nil,
                            andButtons: nil)
        }
    }

    
    
//    func checkTextCount(text : String?) -> ( String , Bool) {
//        guard let x = text , x.characters.count >= 6 else {
//            return ("" ,  false )
//        }
//        return ("" ,  true )
//    }
}

