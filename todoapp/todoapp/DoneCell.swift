//
//  DoneCell.swift
//  todoapp
//
//  Created by Divyaraj Bakrola on 11/11/18.
//  Copyright © 2018 Divyaraj Bakrola. All rights reserved.
//

import UIKit

class DoneCell: UITableViewCell {
    
    
    @IBOutlet weak var completedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
