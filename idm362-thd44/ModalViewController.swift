//
//  ModalViewController.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/1/23.
//

import UIKit

class ModalViewController: UIViewController {

    @IBOutlet weak var priorityPopupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        setupPriorityPopupButton()

        // Do any additional setup after loading the view.
    }
    
    // Navbar Code
    
    func configureNavigation() {
        self.navigationItem.title = "Add New Task"
        
        let attributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        
        self.navigationController?.navigationBar.titleTextAttributes = attributes
    }
    
    
    
    
    
    func setupPriorityPopupButton(){
        let optionsObj = {
            (action: UIAction) in print(action.title)
        }
        priorityPopupButton.menu = UIMenu(children: [
            UIAction(title: "Low", handler: optionsObj),
            UIAction(title: "Medium", handler: optionsObj),
            UIAction(title: "High", handler: optionsObj)
        ])
        priorityPopupButton.showsMenuAsPrimaryAction = true
        priorityPopupButton.changesSelectionAsPrimaryAction = true
    }

}
