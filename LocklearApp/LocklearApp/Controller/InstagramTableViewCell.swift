//
//  InstagramTableViewCell.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 03/10/2021.
//

import UIKit

class InstagramTableViewCell: UITableViewCell {

  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------

  @IBOutlet weak var pictureImageView: UIImageView!
  @IBOutlet weak var captionPictureLabel: UILabel!
  @IBOutlet weak var contentInstagramView: UIView!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func awakeFromNib() {
    super.awakeFromNib()
    setupCornerRadius()
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  func setupCornerRadius() {
    contentInstagramView.clipsToBounds = true
    contentInstagramView.layer.cornerRadius = 6
    contentInstagramView.layer.borderWidth = 0
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  func configure(urlMedia: String, caption: String) {
    pictureImageView.load(link: urlMedia)
    captionPictureLabel.text = caption
  }

}
