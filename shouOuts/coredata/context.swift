//
//  context.swift
//  shouOuts
//
//  Created by Varun M S on 19/11/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import Foundation
import CoreData
func getContext()->NSManagedObjectContext
    
{
    let modelUrl = Bundle.main.url(forResource: "Shout", withExtension: "momd")
    let model = NSManagedObjectModel(contentsOf: modelUrl!)
    
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: model!)
    
    let storeUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("Shout.sqlite")
    try! FileManager.default.removeItem(at: storeUrl)
    
    try! psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeUrl, options: nil)
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    context.persistentStoreCoordinator = psc
    return context
    
}
protocol mainContextProtocol{
    var mangedObjectContext:NSManagedObjectContext!{ get set}
}
