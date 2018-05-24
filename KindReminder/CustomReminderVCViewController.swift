//
//  CustomReminderVCViewController.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 24/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit

class CustomReminderVCViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    
    let picks = ["Once","Daily","Weekly","Monthly"]
    let week = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
    
    var mode = ""
    
    @IBOutlet weak var titleText: UITextField!
    
    @IBOutlet weak var descriptionText: UITextField!
    
    
    @IBOutlet weak var typeText: UITextField!
    
    
    @IBOutlet weak var multiuse: UITextField!
    
    
    @IBOutlet weak var time: UITextField!
    
    
    @IBOutlet weak var onlyDaily: UITextField!
    
    
    @IBOutlet weak var multi: UILabel!
    
    @IBOutlet weak var timings: UILabel!
    
    @IBOutlet weak var onlydaily: UILabel!
    
    
     let dateFormatter = DateFormatter()
     let typePicker = UIPickerView()
     let datePicker = UIDatePicker()
     let timePicker = UIDatePicker()
    
    let weekdayPicker = UIPickerView()
    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onlyDaily.isHidden = true
        
        
        // Do any additional setup after loading the view.
        typePicker.delegate = self
        typePicker.dataSource = self
        createTypePicker()
        
        
        
    }

    
    
    func createTypePicker(){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        
        
        toolbar.setItems([done], animated: false)
        
        typeText.inputAccessoryView = toolbar
        typeText.inputView = typePicker
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == typePicker{
            return picks.count
            
        }else {
            return week.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
      
        if pickerView == typePicker{
            return picks[row]
            
        }else {
            return week[row]
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == typePicker{
            typeText.text = picks[row]
            
        }else {
            multiuse.text = week[row]
        }
        
        
        
        let toolbar1 = UIToolbar()
        toolbar1.sizeToFit()
        
        
        // Always for time
        let toolbar2 = UIToolbar()
        toolbar2.sizeToFit()
        
        multiuse.allowsEditingTextAttributes = true
        
        
        if picks[row] == "Once"{
            mode = "Once"
            let done1 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed1))
            toolbar1.setItems([done1],animated: false)
            
            datePicker.datePickerMode = .date
            multiuse.inputAccessoryView = toolbar1
            multiuse.inputView = datePicker
            
        } else if picks[row] == "Daily"{
            mode = "Daily"
           
            multiuse.text = "Not Applicalbe"
            multiuse.textColor = UIColor.red
        
            multiuse.allowsEditingTextAttributes = false
        }else if picks[row] == "Weekly"{
            
            mode = "Weekly"
            let toolbar3 = UIToolbar()
            toolbar3.sizeToFit()
            
            let done3 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed3))
            toolbar3.setItems([done3],animated: false)
            
            multi.text = "Which day?"
            weekdayPicker.delegate = self
            weekdayPicker.dataSource = self
            
            multiuse.inputAccessoryView = toolbar3
            multiuse.inputView = weekdayPicker
            
        } else{
            mode = "Monthly"
            multi.text = "Select date for monthly reminder."
            
            let done1 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed1))
            toolbar1.setItems([done1],animated: false)
            
            datePicker.datePickerMode = .date
            multiuse.inputAccessoryView = toolbar1
            multiuse.inputView = datePicker
            
        }
        
        let done2 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar2.setItems([done2],animated: false)
        timePicker.datePickerMode = .time
        
        time.inputAccessoryView = toolbar2
        time.inputView = timePicker
        
    }
    
    @objc func donePressed(){
        
        self.view.endEditing(true)
    }
    
    @objc func donePressed3(){
        
        
        self.view.endEditing(true)
    }
    
    @objc func donePressed1(){
        
        
        dateFormatter.dateFormat = "LLLL dd,yyyy"
        multiuse.text = dateFormatter.string(from: datePicker.date)
        
        self.view.endEditing(true)
    }
    
    @objc func donePressed2(){
        
        dateFormatter.dateFormat = "HH:mm"
        time.text = dateFormatter.string(from: timePicker.date)
        
        self.view.endEditing(true)
    }

    
    @IBAction func createReminder(_ sender: UIButton) {
        
        
        
        if mode == "Once"{
            
            dateFormatter.dateFormat = "LLLL dd,yyyy"
            let date1 = dateFormatter.date(from: multiuse.text!)
            print(date1)
            
            dateFormatter.dateFormat = "HH:mm"
            
            let time1 = dateFormatter.date(from: time.text!)
            print(time1)
            
            let item = ReminderItem(title: titleText.text!, description: descriptionText.text!, type: typeText.text!, date: date1!, time: time1!, weekday: "", isOn: true, itemId: UUID())
            
            
            item.saveItem()
            
            print(item)
        }else if mode == "Daily"{
            
        }else if mode == "Weekly"{
            
        }else {
            
        }
        
        //save it
        
        
        
        
    }
    
}
