//
//  FirstViewController.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 24/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var welcome: UILabel!
    
    
    @IBOutlet weak var currentTime: UILabel!
    
    @IBOutlet weak var currentDate: UILabel!
    
    @IBOutlet weak var quoteHome: UILabel!
    let userName = UserDefaults.standard.object(forKey: "name") as? String
    let quote = UserDefaults.standard.object(forKey: "QuoteON") as? Bool
    let quoteText = UserDefaults.standard.object(forKey: "userQuote") as? String
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UserDefaults.standard.set("Chiku", forKey: "name")
        getCurrentDateTime()
        personalise()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCurrentDateTime(){
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL dd,yyyy"
        currentDate.text = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "HH:mm"
        currentTime.text = dateFormatter.string(from: date)
    }
    
    func personalise(){
        if (userName != nil){
            welcome.text = "Good day \(String(describing: userName))"
        }
        if (quote! && quoteText != nil){
            quoteHome.text = quoteText
        }else{
            
            quoteHome.text = "The only journey is the one within."
        }
    }
    
    

}

