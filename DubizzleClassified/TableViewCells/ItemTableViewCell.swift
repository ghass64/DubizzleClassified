//
//  ItemTableViewCell.swift
//  DubizzleClassified
//
//  Created by Ghassan Fathi Al Marei on 28/10/2021.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var itemDateLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
       
    var item : Result? {
           didSet {
               itemNameLabel.text = item?.name
               itemDateLabel.text = item?.createdAt.convertDateFormat()
               itemPriceLabel.text = item?.price
               itemPriceLabel.attributedText = AttributedString.getAttributedString(price: item!.price, fontSize: 11)
               itemImage.roundedView()

               // set image from caching or fetch in background
               let imageURL = (item?.imageUrlsThumbnails[0]) ?? ""
               ImageLoader.loadURL(url: URL(string: imageURL)!, placeholder: UIImage(named:"defaultThumbnail"), cache: URLCache.shared, myImageView: itemImage)
               
           }
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
