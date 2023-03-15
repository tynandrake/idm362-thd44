//
//  TableViewController.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/2/23.
//

import UIKit
// COREDATA 1
import CoreData

class TableViewControllerFriends: UITableViewController {
  
  // Global Vars
   var fNames: [String] = ["Judith", "Jennifa", "John", "Joseph", "Jervis"]
  
  // COREDATA 2
  var peopleObj: [NSManagedObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()

      // Uncomment the following line to preserve selection between presentations
      // self.clearsSelectionOnViewWillAppear = false

      // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
      // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
  
    // COREDATA 3
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)

      guard let appDelegate =
        UIApplication.shared.delegate as? AppDelegate else {
        return
      }
      
      //1
      let managedContext = appDelegate.persistentContainer.viewContext

      //2
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")

      //3
      do {
        peopleObj = try managedContext.fetch(fetchRequest)
      } catch let error as NSError {
        print("Could not fetch. \(error), \(error.userInfo)")
      }
    }

    // MARK: - Table view data source

    // jwt STEP ONE
    override func numberOfSections(in tableView: UITableView)
      -> Int {
      // #warning Incomplete implementation, return the number of sections
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
      -> Int {
      // #warning Incomplete implementation, return the number of rows
        
      // return fNames.count
      // COREDATA 4
      return peopleObj.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
      -> UITableViewCell {
        
        // CUSTOM CELL 1
        // let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
      
//        // CUSTOM CELL 2
//        // cell.textLabel?.text = fNames[indexPath.row]
//        cell.fName?.text = fNames[indexPath.row]
        
        
        // COREDATA 5
        let personObj = peopleObj[indexPath.row]
        cell.fName?.text = personObj.value(forKey: "name") as? String
        
        
        let rNum = Int.random(in: 1...100)
        cell.fNumStr?.text = String(rNum)
        
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
  
  // COREDATA 6
  // Link context to persistentContainer
  let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
  
    // Swipe to delete
    //
    // jwt STEP THREE
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        // Delete from array
//        fNames.remove(at: indexPath.row)
//        print("fname count \(fNames)")
        
        // COREDATA 10
        // extract person from CoreData
        let onePerson = peopleObj[indexPath.row]
        // Delete that person from context
        context.delete(onePerson)
        // Save context back to CoreData
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // get fresh data
        do {
          peopleObj = try context.fetch(Person.fetchRequest())
          print("People Entity Fetching Successfull.. " + String(peopleObj.count))
        }
        catch {
          print("People Entity Fetching Failed")
        }
        
        // Reload Table
        tableView.reloadData()
      }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
  
  
  // jwt STEP TWO
  @IBAction func addName(_ sender: Any) {
    let alertObj = UIAlertController(title: "New Friend?", message: "Add a new name", preferredStyle: .alert)
    //
    alertObj.view.tintColor = UIColor.init(named: "AccentColor")
    //
    let saveAction = UIAlertAction(title: "Save", style: .default) {
      [unowned self] action in
      guard let textField = alertObj.textFields?.first,
        let nameToSave = textField.text else {
          return
      }
//      // Update Array
//      self.fNames.append(nameToSave)
      
      // COREDATA 7
      self.saveToCore(name: nameToSave)
      
      // Reload Table
      self.tableView.reloadData()
    }
    //
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    //
    alertObj.addTextField()
    //
    alertObj.addAction(saveAction)
    alertObj.addAction(cancelAction)
    //
    present(alertObj, animated: true)
  }
  
  //COREDATA 8
  func saveToCore(name: String) {
    guard let appDelegate =
      UIApplication.shared.delegate as? AppDelegate else {
      return
    }

    // 1
    let managedContext = appDelegate.persistentContainer.viewContext

    // 2
    let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!

    let person = NSManagedObject(entity: entity, insertInto: managedContext)

    // Target ONE person in entity
    person.setValue(name, forKeyPath: "name")

    // 3
    do {
      try managedContext.save()
      peopleObj.append(person)
    } catch let error as NSError {
      print("Could not save. \(error), \(error.userInfo)")
    }
  }
  


  // MARK: - Navigation
  
  // jwt STEP FIVE
  // Remember selected row and seque to showDetail
  var selRowNum:Int = 0
  var selRowName:String = ""
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print("Row selected " + indexPath.row.description)
    
    selRowNum = indexPath.row
//    selRowName = fNames[selRowNum]
    
    //COREDATA 9
    let personObj = peopleObj[indexPath.row]
    selRowName = (personObj.value(forKey: "name") as! String)
    
    // Trigger Segue
    performSegue(withIdentifier: "showDetail", sender: nil)
  }

  // jwt STEP FOUR
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    if segue.identifier == "showDetail" {
      let detailObj = segue.destination as! DetailViewController
      detailObj.ndxNum = selRowNum
      detailObj.incomingName = selRowName
    }
  }
}
