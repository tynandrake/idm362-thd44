//
//  CustomTableViewCell.swift
//  idm362-thd44
//
//  Created by Ty Drake on 3/9/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

  @IBOutlet weak var fName: UILabel!
  @IBOutlet weak var fNumStr: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
