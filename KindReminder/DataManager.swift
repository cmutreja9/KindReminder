//
//  DataManager.swift
//  KindReminder
//
//  Created by Chinky Mutreja on 24/5/18.
//  Copyright © 2018 Chinky Mutreja. All rights reserved.
//

import Foundation



public class DataManager {
    
    static fileprivate func getCurrentDirectory() -> URL {
        
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first{
            
            print(url)
            return url
        }else {
            fatalError("Unable to access document directory")
        }
        
    }
    
    
    static func save <T:Encodable>(_ object: T, with filename : String){
        let url = getCurrentDirectory().appendingPathComponent(filename,isDirectory:false)
        
        let encoder = JSONEncoder()
        
        do {
            let data =  try encoder.encode(object)
            if FileManager.default.fileExists(atPath: url.path){
                try FileManager.default.removeItem(at:url)
            }
            FileManager.default.createFile(atPath:url.path,contents:data,attributes:nil)
            
            
        }catch {
            fatalError(error.localizedDescription)
        }
        
        
    }
    
    
    // Load the data
    
    static func load <T:Decodable>(_ filename:String,with type:T.Type) -> T{
    let url = getCurrentDirectory().appendingPathComponent(filename,isDirectory: false)
        
        print(url)
    if !FileManager.default.fileExists(atPath:url.path)
    {
    fatalError("File not found at path \(url.path)")
    }
    
    if let data = FileManager.default.contents(atPath:url.path){
    
    do{
    let model = try JSONDecoder().decode(type,from:data)
    return model
    }catch{
    fatalError(error.localizedDescription)
    }
    }else{
    
    fatalError("Data not found at path \(url.path)")
    }
    
    
    }
    
    // load data from file.
    
    static func loadData(_ filename:String) -> Data?{
        let url = getCurrentDirectory().appendingPathComponent(filename,isDirectory: false)
        if !FileManager.default.fileExists(atPath:url.path)
        {
            fatalError("File not found at path \(url.path)")
        }
        
        if let data = FileManager.default.contents(atPath:url.path){
            
            return data
        }else{
            
            fatalError("Data not found at path \(url.path)")
        }
        
    }
    
    // load all files from directory
    
    static func loadAll<T:Decodable>(_ type: T.Type)->[T]{
        do{
            let files = try FileManager.default.contentsOfDirectory(atPath: getCurrentDirectory().path)
            
            
            var modelObjects = [T]()
            
            for filename in files{
                modelObjects.append(load( filename,with: type))
                
            }
            return modelObjects
        }catch{
            fatalError("could not load files")
        }
        
        
    }
    
    
    
    static func loadAllFromPath<T:Decodable>(_ type: T.Type, url : URL)->[T]{
        do{
            let files = try FileManager.default.contentsOfDirectory(atPath: url.path)
            
            
            var modelObjects = [T]()
            
            for filename in files{
                modelObjects.append(load( filename,with: type))
                
            }
            return modelObjects
        }catch{
            fatalError("could not load files")
        }
        
        
    }
    
    //delete files
    static func delete(_ filename : String){
    let url = getCurrentDirectory().appendingPathComponent(filename,isDirectory:false)
    
    if FileManager.default.fileExists(atPath:url.path){
    do{
    try FileManager.default.removeItem(at:url)
    }catch{
    fatalError(error.localizedDescription)
    }
    
    
    }
    
    
    }
    
    
    // End of class
}



