//
//  FieldSearchByDateViewController.swift
//  Elmla3eb
//
//  Created by Killvak on 17/01/2017.
//  Copyright © 2017 Killvak. All rights reserved.
//

import UIKit

class FieldSearchByDateViewController: UIViewController , UITableViewDelegate , UITableViewDataSource , UITextFieldDelegate{

    @IBOutlet weak var searchByDate: UITextField!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
tableView.delegate = self
        tableView.dataSource = self
        searchByDate.delegate = self
        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(FieldSearchByDateViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchFieldByDateTableViewCell
        
        return cell
    }
    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    @IBAction func startSearching(_ sender: UIButton) {
        dismissKeyboard()
print("Pressed Button")
//        dissmissKeyBoardbytappingButton()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Date picker 
    func datePickerChanged(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        searchByDate.text = formatter.string(from: sender.date)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == searchByDate {
            let datePicker = UIDatePicker()
            
            datePicker.datePickerMode = UIDatePickerMode.date
            datePicker.minimumDate = NSDate() as Date
            
            textField.inputView = datePicker
            datePicker.addTarget(self, action: #selector(FieldSearchByDateViewController.datePickerChanged(_:)), for: .valueChanged)
        }    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if  textField == searchByDate ,  searchByDate.text == "" {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy"
            searchByDate.text = formatter.string(from: NSDate() as Date)
            
        }     }
    
    //

}
