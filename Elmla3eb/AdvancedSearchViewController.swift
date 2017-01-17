//
//  AdvancedSearchViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 16/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit

class AdvancedSearchViewController: UIViewController , UITextFieldDelegate{

    @IBOutlet weak var fieldTypeTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    
    var cityPicker: UIPickerView!
    var fieldTypePicker: UIPickerView!

    var checkBoxIndexArray = [Int]()
    let citiesList = ["الكل","الرياض","جدة","المدينة","الدمام","عرعر","خميس مشيط","القصيم","الخرج"]
    let fieldType = ["الكل","نجيلة","ترتان"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fieldTypeTextField.delegate = self
        self.cityTextField.delegate = self
        
        self.pickerSetUp()
    }

    func pickerSetUp() {
        cityPicker = UIPickerView()
        cityPicker.tag = 3
        cityPicker.dataSource = self
        cityPicker.delegate = self
        
        cityTextField.inputView = cityPicker
        
        
        fieldTypePicker = UIPickerView()
        fieldTypePicker.tag = 3
        fieldTypePicker.dataSource = self
        fieldTypePicker.delegate = self
        
        fieldTypeTextField.inputView = fieldTypePicker
    }
 
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == cityTextField ,  cityTextField.text == "" {
            cityTextField.text = citiesList[0]
            
        }else  if  textField == fieldTypeTextField ,  fieldTypeTextField.text == "" {
            fieldTypeTextField.text = fieldType[0]
            
        }
    }

    @IBAction func fieldAdvancedDetailsBtnAction(_ sender: UIButton) {
        
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
