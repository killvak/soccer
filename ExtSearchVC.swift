//
//  ExtSearchVC.swift
//  Elmla3eb
//
//  Created by Killvak on 15/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation


extension SearchViewController :  UIPickerViewDelegate, UIPickerViewDataSource {
 
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gradePickerValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return gradePickerValues[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cityTextField.text = gradePickerValues[row]
        self.view.endEditing(true)
    }

    
}
