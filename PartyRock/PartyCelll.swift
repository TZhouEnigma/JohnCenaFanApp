//
//  PartyCellTableViewCell.swift
//  PartyRock
//
//  Created by chuxiang zhou on 5/24/17.
//  Copyright © 2017 chuxiang zhou. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var VideoPreviewImage: UIImageView!
    
    @IBOutlet weak var VideoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    func updateUI(partyRock: PartyRock) {
        VideoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().sync {
                    self.VideoPreviewImage.image = UIImage(data: data)
                }
            } catch  {
                //handle the error
            }
        }
}
}
