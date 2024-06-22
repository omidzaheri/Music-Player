//
//  MusicCell.swift
//  Music Player
//
//  Created by Omid Zaheri on 6/4/24.
//

import UIKit

class MusicCell: UITableViewCell {
    
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var musicName: UILabel!
    
    
    @IBOutlet weak var singerName: UILabel!
    
    
    @IBOutlet weak var songTime: UILabel!
    
    
    @IBOutlet weak var cover: UIImageView!
    
    
}


let button = UIButton()
