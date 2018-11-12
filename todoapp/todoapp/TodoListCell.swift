//
//  TodoListCell.swift
//  todoapp
//
//  Created by Divyaraj Bakrola on 10/30/18.
//  Copyright © 2018 Divyaraj Bakrola. All rights reserved.
//

import UIKit

class TodoListCell: UITableViewCell {
    
    @IBOutlet weak var taskTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
