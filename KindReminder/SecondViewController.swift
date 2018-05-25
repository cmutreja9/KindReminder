//
//  SecondViewController.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 24/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    
    var abc = ["Sorry I can't show","and set reminders","but I have UI"]
   
    
   
    
    var tableitems = [ReminderItem]()
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       return abc.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell_one = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        
        
      
        cell_one.textLabel?.text = abc[indexPath.row]
        
        return cell_one

    
    }
    
    
    
    
   
   
   
    
    
   // var items = [ReminderItem]()
    
   /* func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellForItem", for: indexPath) as! RecentTableViewCell
        
        //cell.itemTitle?.text = items[indexPath.row].title
        //cell.desctext?.text = items[indexPath.row].description
        cell.itemTitle?.text = abc[indexPath.row]
        cell.desctext?.text = abc[indexPath.row]
        
        return cell
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return items.count
        return abc.count
        
        
    }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       //items =  DataManager.loadAll(ReminderItem.self)
    }

    
    
   
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

