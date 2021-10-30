//
//  YoutubeTableViewCell.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 30/10/2021.
//

import UIKit

class YoutubeTableViewCell: UITableViewCell {

  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------

  @IBOutlet weak var youtubeImageView: UIImageView!
  @IBOutlet weak var youtubeLabel: UILabel!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func awakeFromNib() {
      super.awakeFromNib()
      // Initialization code
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

      // Configure the view for the selected state
  }

  func configure(urlMedia: String, caption: String) {
    youtubeImageView.load(link: urlMedia)
    youtubeLabel.text = caption
  //  contentView.isUserInteractionEnabled = true
  }
}
