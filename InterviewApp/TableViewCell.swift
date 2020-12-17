//
//  TableViewCell.swift
//  InterviewApp
//
//  Created by Bartłomiej Smektała on 16/12/2020.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var myTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
