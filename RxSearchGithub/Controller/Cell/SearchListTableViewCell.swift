//
//  SearchListTableViewCell.swift
//  RxSearchGithub
//
//  Created by 이상범 on 2020/07/01.
//  Copyright © 2020 sangbeomLee. All rights reserved.
//

import UIKit

class SearchListTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
