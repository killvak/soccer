//
//  SearchViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 15/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController  , UITextFieldDelegate{

    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
    var gradePicker: UIPickerView!
    
    let gradePickerValues = ["الكل","الرياض","جدة","المدينة","الدمام","عرعر","خميس مشيط","القصيم","الخرج"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dateTextField.delegate = self
        cityTextField.delegate = self
        timeTextField.delegate = self
        
        gradePicker = UIPickerView()
        gradePicker.tag = 3 
        gradePicker.dataSource = self
        gradePicker.delegate = self
        
        cityTextField.inputView = gradePicker
        revealMenu()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func datePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateTextField.text = formatter.string(from: sender.date)
    }
    func timePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        timeTextField.text = formatter.string(from: sender.date)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == dateTextField {
            let datePicker = UIDatePicker()

            datePicker.datePickerMode = UIDatePickerMode.date
            datePicker.minimumDate = NSDate() as Date

            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(SearchViewController.datePickerChanged(_:)), for: .valueChanged)
        }else  if textField == timeTextField {
            let datePicker = UIDatePicker()
//            if    dateTextField.text != "" {
//
//           let date =  turnStringToDate()
//                print(date)
//                print(NSDate())
//                if NSDate() as Date == date {
//                    datePicker.minimumDate = NSDate() as Date
//                }
//            }
            datePicker.datePickerMode = UIDatePickerMode.time
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(SearchViewController.timePickerChanged(_:)), for: .valueChanged)
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == dateTextField ,  dateTextField.text == "" {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            dateTextField.text = formatter.string(from: NSDate() as Date)

        } else if  textField == timeTextField ,  timeTextField.text == "" {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm a"
            let date = NSDate()
            timeTextField.text = formatter.string(from: date as Date )

            
        }else  if  textField == cityTextField ,  cityTextField.text == "" {
            cityTextField.text = gradePickerValues[0]
            
        }
    }
    func turnStringToDate() ->Date  {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let date = dateFormatter.date(from: dateTextField.text!)
        return date!
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
