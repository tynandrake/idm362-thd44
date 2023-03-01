//
//  ViewController.swift
//  coreData-test
//
//  Created by Ty Drake on 3/1/23.
//
//UITableViewDelegate, UITableViewDataSource
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

        configureNavigation()
        tableView.delegate = self
        tableView.dataSource = self
        
                                                     
    }
    
    // Navbar Code
    
    func configureNavigation() {
        self.navigationItem.title = "My Tasks"
        
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.systemPink]
        
        self.navigationController?.navigationBar.largeTitleTextAttributes = attributes
    }
    
    @IBAction func unwindSegue(_ sender: UIStoryboardSegue) {
        
    }
    
    // Table View Code
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = "cell \(indexPath.row)"
        cell?.textLabel?.textColor = UIColor.white
        return cell!
    }
    
}
