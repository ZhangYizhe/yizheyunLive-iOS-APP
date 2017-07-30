//
//  LivesTableViewCell.swift
//  yizhibo
//
//  Created by 张艺哲 on 2017/7/26.
//  Copyright © 2017年 张艺哲. All rights reserved.
//

import UIKit

class LivesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgPor: UIImageView!
    @IBOutlet weak var labelNick: UILabel!
    @IBOutlet weak var labelAddr: UILabel!
    @IBOutlet weak var labelViewers: UILabel!
    @IBOutlet weak var imgBigPor: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
