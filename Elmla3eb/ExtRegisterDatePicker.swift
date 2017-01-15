//
//  ExtRegisterDatePicker.swift
//  Elmla3eb
//
//  Created by Killvak on 15/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import Foundation


extension RegisterViewController {
    
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

    
}
