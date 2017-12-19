//
//  NotificacaoTableViewCell.swift
//  Guardian
//
//  Created by Brenno Hayden on 11/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class NotificacaoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak var lbTitulo: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

