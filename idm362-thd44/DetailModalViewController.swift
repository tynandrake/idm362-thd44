//
//  DetailModalViewController.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/2/23.
//

import UIKit

class DetailViewController: UIViewController {
  
  // SET UP vars for SEQUE
  var ndxNum:Int?
  var incomingName:String?
  
  @IBOutlet weak var bigName: UILabel!
  

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    
    bigName.text = incomingName?.uppercased()
  }
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

}
