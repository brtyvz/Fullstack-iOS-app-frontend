//
//  NotePrototypeCell.swift
//  NoteApp
//
//  Created by Berat Yavuz on 28.12.2022.
//

import UIKit

class NotePrototypeCell: UITableViewCell {

    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var BodyLbl: UILabel!
    @IBOutlet weak var TitleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
