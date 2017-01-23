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
    @IBOutlet weak var fieldsTypeViewHeight: NSLayoutConstraint!
    
    @IBOutlet weak var typeOfFieldsViewOL: UIView!
    //set selection OutLets
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var playerLbl: UILabel!
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var coachImage: UIImageView!
    @IBOutlet weak var coachLbl: UILabel!
    @IBOutlet weak var coachView: UIView!
    
    //
    
    let pinkColor = UIColor(colorLiteralRed: 221/255, green: 63/255, blue: 74/255, alpha: 1)
    let registerTFDelegate = RegisterTextFieldDeledate()
    var checkBoxIndexArray = [Int]()
    var isFieldOwner = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        delegates()
        setTypeOfFieldsViewLayout()
        setIsownerOrPlayerViewLayout()
        
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    func delegates() {
        
        firstNameTF.delegate = registerTFDelegate
        emailTF.delegate = registerTFDelegate
        passwordTF.delegate = registerTFDelegate
        retypePasswordTF.delegate = registerTFDelegate
        phoneNumberTF.delegate = registerTFDelegate
        birthDateTF.delegate = self
        cityTF.delegate = registerTFDelegate
        neighborTF.delegate = registerTFDelegate
    }
    
    func setTypeOfFieldsViewLayout() {
        self.typeOfFieldsViewOL.layer.cornerRadius  = 15
        self.typeOfFieldsViewOL.clipsToBounds = true
        self.typeOfFieldsViewOL.layer.borderWidth = 2
        self.typeOfFieldsViewOL.layer.borderColor = self.pinkColor.cgColor
    }
    
    func setIsownerOrPlayerViewLayout() {
        let views = [ playerView,coachView]
        let width = playerView.frame.size.width / 2
        for i in views {
            i?.layer.cornerRadius  = width
            i?.clipsToBounds = true
            i?.layer.borderWidth = 2.5
        }
        
        
        ownerOrPlayer()
    }
    
    func ownerOrPlayer() {
        
        if isFieldOwner {
            self.playerView.layer.borderColor  = self.pinkColor.cgColor
            
            coachView.backgroundColor = self.pinkColor
            coachLbl.textColor = UIColor.white
            coachImage.image = UIImage(named : "white_Coach" )
            coachView.layer.borderColor = UIColor.white.cgColor
            
            self.playerView.backgroundColor = UIColor.white
            self.playerLbl.textColor =  self.pinkColor
            self.playerImage.image = UIImage(named: "pin")
            self.playerView.layer.borderColor = self.pinkColor.cgColor
            self.typeOfFieldsViewOL.isHidden = false
            self.fieldsTypeViewHeight.constant = 136
            
            
        }else {
            self.playerView.layer.borderColor  = UIColor.white.cgColor
            self.playerView.layer.borderColor = self.pinkColor.cgColor
            playerLbl.textColor = UIColor.white
            playerImage.image = UIImage(named : "white_Player" )
            playerView.backgroundColor = self.pinkColor

            coachView.layer.borderColor = UIColor.white.cgColor
            self.coachView.backgroundColor = UIColor.white
            self.coachLbl.textColor = self.pinkColor
            self.coachImage.image = UIImage(named: "Coach_d32437_100")
            self.coachView.layer.borderColor = self.pinkColor.cgColor
            self.fieldsTypeViewHeight.constant = 0
            self.typeOfFieldsViewOL.isHidden = true
        }
    }
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
    
    @IBAction func dismissViewButton(_ sender: UIButton) {
        
        dismiss(animated:true,completion:nil)
    }
    
    
    
    @IBAction func fieldTypesBtnActioninView(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            checkBoxFuncionality(sender: sender)
            break
        case 1:
            checkBoxFuncionality(sender: sender)
            
            break
        case 2:
            checkBoxFuncionality(sender: sender)
            break
        case 3:
            checkBoxFuncionality(sender: sender)
            break
        case 4:
            checkBoxFuncionality(sender: sender)
            break
        default:
            print("Unknown language")
            return
        }
        print(self.checkBoxIndexArray)
    }
    
    func checkBoxFuncionality(sender : UIButton) {
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected {
            sender.setImage(#imageLiteral(resourceName: "Checked Checkbox 2_d32437_50"), for: UIControlState.selected)
            self.checkBoxIndexArray.append(sender.tag)
        }else {
            sender.setImage(#imageLiteral(resourceName: "Unchecked Checkbox_d32437_50"), for: UIControlState.normal)
            self.checkBoxIndexArray.remove(sender.tag)
        }
    }
    
    
    @IBAction func ownerOrPlayerFieldBtnAct(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            isFieldOwner = false
            
//            playerOrOwner(sender: sender, theView: playerView, Lable: playerLbl,uiImage : playerImage , image : "white_Player")
            
            break
        case 1:
            isFieldOwner = true
            
//            playerOrOwner(sender: sender, theView: coachView, Lable: coachLbl,uiImage : coachImage , image : "white_Coach")
            break
            
        default:
            print("Unknown language")
            return
        }
        ownerOrPlayer()
        print(self.checkBoxIndexArray)
    }
    
//    func playerOrOwner(sender : UIButton , theView : UIView ,Lable : UILabel, uiImage : UIImageView,image : String) {
//        theView.backgroundColor = self.pinkColor
//        Lable.textColor = UIColor.white
//        uiImage.image = UIImage(named : image )
//        theView.layer.borderColor = UIColor.white.cgColor
//        
//        
//    }
    
    
    //    func checkTextCount(text : String?) -> ( String , Bool) {
    //        guard let x = text , x.characters.count >= 6 else {
    //            return ("" ,  false )
    //        }
    //        return ("" ,  true )
    //    }
}

