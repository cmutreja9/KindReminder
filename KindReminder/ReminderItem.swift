//
//  ReminderItem.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 24/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import Foundation

struct ReminderItem : Codable {
    
    var title : String
    var description : String
    var type : String
    var date : Date
    var time : Date
    
    var weekday : String
    var isOn : Bool
    var itemId : UUID
    
    
    func getCurrentDirectory() -> URL {
        
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            return url
        }else {
            fatalError("Unable to access document directory")
        }
        
    }
    
    func saveItem(){
        
        //let encoder = JSONEncoder()
        DataManager.save(self, with : itemId.uuidString)
    }
    
    func deleteItem(){
        
        DataManager.delete(itemId.uuidString)
    }
    
    mutating func editItem(){
        
        DataManager.save(self, with : itemId.uuidString)
    }
    
    
}
