//
//  NewsCell.swift
//  NewsApp
//
//  Created by Przemysław Woźny on 18/04/2022.
//

import UIKit

class NewsCell: UITableViewCell {

    @IBOutlet weak var pageSource: UILabel!
    @IBOutlet weak var dateCreation: UILabel!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
