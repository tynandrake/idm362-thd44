//
//  ViewControllerTransaction.swift
//  idm362-thd44
//
//  Created by Ty Drake on 2/16/23.
//

import UIKit

class ViewControllerTransaction: UIViewController {

    
    @IBOutlet weak var popupTransactionType: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTransactionType()
    }
    
    func setupTransactionType() {
        // Transaction Type Setup
        let optionsObj = {
            (action : UIAction) in print(action.title)
        }
        popupTransactionType.menu = UIMenu(children : [
            UIAction(title: "Income", handler: optionsObj),
            UIAction(title: "Expense", handler: optionsObj)
        ])
        popupTransactionType.showsMenuAsPrimaryAction = true
        popupTransactionType.changesSelectionAsPrimaryAction = true
    }

}
