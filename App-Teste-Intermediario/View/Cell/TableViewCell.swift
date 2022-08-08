//
//  TableViewCell.swift
//  App-Teste-Intermediario
//
//  Created by Kleiton Mendes on 05/06/22.
//


import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(value: Character) {
        self.nameLabel.text = value.name
        self.nameLabel.adjustsFontSizeToFitWidth = true
        self.descriptionLabel.text = value.description
        self.descriptionLabel.adjustsFontSizeToFitWidth = true
        let url = extractImage(data: value.thumbnail)
        self.myImage.sd_setImage(with: url)
    }
    
    func extractImage(data: [String: String]) -> URL? {
        let path = data["path"] ?? ""
        let imageExtension = data["extension"] ?? ""
        print("\(path).\(imageExtension)")
        return URL(string: "\(path).\(imageExtension)")
    }
    
}
