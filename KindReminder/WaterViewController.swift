//
//  WaterViewController.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 25/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit




class WaterViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    
    var intervals = [Interval]()
    
    var n : String  = ""
    var m: Int = 0
    @IBOutlet weak var labelTop: UILabel!
    
    @IBOutlet weak var firstTime: UITextField!
    @IBOutlet weak var lastTime: UITextField!
    
    @IBOutlet weak var often: UITextField!
    
    let picker = UIPickerView()
    
    let timePicker = UIDatePicker()
    let timePicker2 = UIDatePicker()
    
    var min = Array(30...59)
    var hour = Array(1...8)
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
      intervals.append(Interval(interval: "minutes", nb: min))
        
      intervals.append(Interval(interval: "Hour(s)", nb: hour))
        picker.delegate = self
        picker.dataSource = self
        
        createPicker()
    }
    
    func createPicker(){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        let done = UIBarButtonItem(barButtonSystemItem: .done,target : nil,action : #selector(donePressed))
        
        
        toolbar.setItems([done], animated: false)
        
        
        often.inputAccessoryView = toolbar
       often .inputView = picker
        
        
        let toolbar2 = UIToolbar()
        toolbar2.sizeToFit()
        let done2 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed2))
        toolbar2.setItems([done2],animated: false)
        timePicker.datePickerMode = .time
        
        firstTime.inputAccessoryView = toolbar2
        firstTime.inputView = timePicker
        
        let toolbar3 = UIToolbar()
        toolbar3.sizeToFit()
        let done3 = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed3))
        toolbar3.setItems([done3],animated: false)
        timePicker2.datePickerMode = .time
        
        lastTime.inputAccessoryView = toolbar3
        lastTime.inputView = timePicker2
        
        
        
        
    }
    
    @objc func donePressed2(){
        
        dateFormatter.dateFormat = "HH:mm"
        firstTime.text = dateFormatter.string(from: timePicker.date)
        
        self.view.endEditing(true)
    }
    
    
    @objc func donePressed3(){
        
        dateFormatter.dateFormat = "HH:mm"
       lastTime.text = dateFormatter.string(from: timePicker2.date)
        
        self.view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return intervals.count
        }
        else{
            let select = picker.selectedRow(inComponent: 0)
            return intervals[select].nb.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return intervals[row].interval
        }
        else{
            let select = picker.selectedRow(inComponent: 0)
            return String(intervals[select].nb[row] )
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        
        n = intervals[pickerView.selectedRow(inComponent: 0)].interval
        
        
        m = intervals[pickerView.selectedRow(inComponent: 1)].nb[row]
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func donePressed(){
        
        
        self.view.endEditing(true)
        
        often.text = "\(m) \(n)"
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
