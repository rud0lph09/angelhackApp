//
//  DetailCell.swift
//  Chamba
//
//  Created by Rodolfo Castillo Vidrio on 24/06/18.
//  Copyright © 2018 Rodolfo Castillo Vidrio. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var info: UITextView!
    
    func fill(withTitle title: String, withInfo info: String){
        self.title.text = title
        self.info.text = info
    }
}
