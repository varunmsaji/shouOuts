//
//  addViewController.swift
//  shouOuts
//
//  Created by Varun M S on 19/11/17.
//  Copyright © 2017 Tectra. All rights reserved.
//

import UIKit
import CoreData
class addViewController: UIViewController ,mainContextProtocol{
    var emp:[Employe] = []
    var shoutArray:[Shout] = []
    
    
    
    var mangedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        tableView.reloadData()
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
       
        
        

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        let fetchReq = NSFetchRequest<Shout>(entityName:Shout.entityName)
        shoutArray = try! mangedObjectContext.fetch(fetchReq)
        tableView.reloadData()
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
extension addViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(shoutArray.count)
        return shoutArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath)
        cell.textLabel?.text = shoutArray[indexPath.row].toemploye?.firstName
        cell.detailTextLabel?.text = shoutArray[indexPath.row].catagory
        return cell
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "maintopicker"
        {
            let destination = segue.destination as! pickViewController
            destination.mangedObjectContext = self.mangedObjectContext
        }
    }
    
}
extension addViewController{
   
}











