//
//  pickViewController.swift
//  shouOuts
//
//  Created by Varun M S on 19/11/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import UIKit
import  CoreData

class pickViewController: UIViewController,mainContextProtocol {
    var mangedObjectContext: NSManagedObjectContext!
    
    var employe:[Employe] = []
    var shoutCatagory:[String] = ["very good","good","poor","very bad","bad"]
    
    
    @IBOutlet weak var namePicker: UIPickerView!
    
    @IBOutlet weak var catagoryPicker: UIPickerView!
    
    //MARK: action methods
    
    
    @IBAction func addButton(_ sender: Any) {
        
        var shoutObj = NSEntityDescription.insertNewObject(forEntityName: Shout.entityName, into: mangedObjectContext) as! Shout
        let employeIndex = namePicker.selectedRow(inComponent: 0)
        shoutObj.toemploye = employe[employeIndex]
        let catagory = catagoryPicker.selectedRow(inComponent: 0)
        shoutObj.catagory = shoutCatagory[catagory]
        try! mangedObjectContext.save()
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namePicker.delegate = self
        namePicker.dataSource = self
        catagoryPicker.delegate = self
        catagoryPicker.dataSource = self
        var fetchreq = NSFetchRequest<Employe>(entityName: Employe.entityName)
        employe = try! mangedObjectContext.fetch(fetchreq)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension pickViewController:UIPickerViewDataSource,UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == namePicker{
            return employe.count
        }
        else{
        return shoutCatagory.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == namePicker{
            return employe[row].firstName
        }
        else {
        return shoutCatagory[row]
        }
    }
}




