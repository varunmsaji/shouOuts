//
//  dataService.swift
//  shouOuts
//
//  Created by Varun M S on 19/11/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import Foundation
import CoreData
struct dataService:mainContextProtocol{
    var mangedObjectContext: NSManagedObjectContext!
    func enterData(){
        do{
        var emp = NSEntityDescription.insertNewObject(forEntityName: Employe.entityName, into: mangedObjectContext) as! Employe
        emp.firstName = "vaun"
        emp.lastName = "ms"
            var emp1 = NSEntityDescription.insertNewObject(forEntityName: Employe.entityName, into: mangedObjectContext) as! Employe
            emp1.firstName = "ashin"
            emp1.lastName = "asok"
            var emp2 = NSEntityDescription.insertNewObject(forEntityName:Employe.entityName, into: mangedObjectContext) as! Employe
            emp2.firstName = "kuri"
            emp2.lastName = "biju"
            var emp3 = NSEntityDescription.insertNewObject(forEntityName: Employe.entityName, into:mangedObjectContext) as! Employe
            emp3.firstName = "alan"
            emp3.lastName = "john"
            
            try mangedObjectContext.save()
        }catch{
            print("save errore\(error.localizedDescription)")
        }
    }
        
   
    
}
