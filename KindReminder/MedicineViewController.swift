//
//  MedicineViewController.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 25/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit


class Interval{
    
    var nb : [Int]
    var interval: String
  
    
    init(interval: String,nb:[Int]){
        
        
        self.interval = interval
        self.nb = nb
    }
}

class MedicineViewController: UIViewController, UIPickerViewDelegate,UIPickerViewDataSource {
    var m : String  = ""
    var n: String = ""
    

    @IBOutlet weak var medName: UITextField!
    
    @IBOutlet weak var medDose: UITextField!
    
    @IBOutlet weak var intervalPicker: UITextField!
    
    
    var intervals = [Interval]()
    
    var min = Array(1...59)
    var hour = Array(1...23)
    var day = Array(1...6)
    var week = Array(1...4)
    var month = Array(1...12)
    
    
   
    
    
    
    
    let datePicker = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        intervals.append(Interval(interval: "minutes", nb: min))
        
        intervals.append(Interval(interval: "Hour(s)", nb: hour))
        intervals.append(Interval(interval: "day(s)", nb: day))
        intervals.append(Interval(interval: "Week(s)", nb: week))
        intervals.append(Interval(interval: "Month(s)", nb: month))
        
        datePicker.delegate = self
        datePicker.dataSource = self
        
        createPicker()
        // Do any additional setup after loading the view.
    }

    
    
    func createPicker(){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        
        let done = UIBarButtonItem(barButtonSystemItem: .done,target : nil,action : #selector(donePressed))
        
        
        toolbar.setItems([done], animated: false)
        
        
        intervalPicker.inputAccessoryView = toolbar
        intervalPicker.inputView = datePicker
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return intervals.count
        }
        else{
            let select = datePicker.selectedRow(inComponent: 0)
            return intervals[select].nb.count
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return intervals[row].interval
        }
        else{
            let select = datePicker.selectedRow(inComponent: 0)
            return String(intervals[select].nb[row] )
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        
        n = intervals[pickerView.selectedRow(inComponent: 0)].interval
        m = String(intervals[pickerView.selectedRow(inComponent: 1)].nb[row])
       
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func donePressed(){
        
        
        self.view.endEditing(true)
        
        intervalPicker.text = "\(m) \(n)"
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
