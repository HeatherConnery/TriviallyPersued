//
//  TriviaTableViewCell.swift
//  TriviallyPersued
//
//  Created by Heather Connery on 2015-11-09.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class TriviaTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var triviaTitle: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
