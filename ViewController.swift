//
//  ViewController.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/15/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var homeTable: UIView!
    override func viewDidLoad() {

        roundViewCorners(view: homeTable, radius: 18)
    }
    
    func roundViewCorners(view: UIView, radius: CGFloat) {
            view.layer.cornerRadius = radius
            view.layer.masksToBounds = true
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
