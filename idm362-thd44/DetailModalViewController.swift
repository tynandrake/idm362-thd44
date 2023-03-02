//
//  DetailModalViewController.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/2/23.
//

import UIKit

class DetailModalViewController: UIViewController {

    // Setup variables for segue
    
    var indexNum:Int?
    var incomingTask:String?
    
    @IBOutlet weak var taskName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        taskName.text = incomingTask?.uppercased()
    }
    
    
    
}
