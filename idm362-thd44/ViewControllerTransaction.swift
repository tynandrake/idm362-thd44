//
//  ViewControllerTransaction.swift
//  idm362-thd44
//
//  Created by Ty Drake on 2/16/23.
//

import UIKit

class ViewControllerTransaction: UIViewController {

    @IBOutlet weak var transactionPopupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setPopupButton()
    }
    
    func setPopupButton() {
        let optionClosure = {(action : UIAction) in
            print(action.title)}
        
        transactionPopupButton.menu = UIMenu(children : [
            UIAction(title: "Income", state : .on, handler: optionClosure),
            UIAction(title: "Expense", handler: optionClosure)])
        
        transactionPopupButton.showsMenuAsPrimaryAction = true
        transactionPopupButton.changesSelectionAsPrimaryAction = true
        }
    }

