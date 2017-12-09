//
//  SinistroTableViewCell.swift
//  Guardian
//
//  Created by Brenno Hayden on 08/12/17.
//  Copyright © 2017 Brenno Hayden. All rights reserved.
//

import UIKit

class SinistroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var imgInfo: UIImageView!
    @IBOutlet weak var imgTipo: UIImageView!
    @IBOutlet weak var lbTitulo: UILabel!
    @IBOutlet weak var imgForma: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
