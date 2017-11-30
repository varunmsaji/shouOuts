//
//  Shout.swift
//  shouOuts
//
//  Created by Varun M S on 19/11/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import Foundation
import CoreData
class Shout:NSManagedObject{
    @NSManaged var from:String?
    @NSManaged var message:String?
    @NSManaged var catagory:String?
    @NSManaged var toemploye:Employe?
    static var entityName:String{
        return "Shout"
    }
}
