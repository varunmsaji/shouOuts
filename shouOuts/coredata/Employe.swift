//
//  Employe.swift
//  shouOuts
//
//  Created by Varun M S on 19/11/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import Foundation
import CoreData
class Employe:NSManagedObject{
    @NSManaged var firstName:String?
    @NSManaged var lastName:String?
    static var entityName:String{
        return "Employe"
    }
    
}
