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
  @IBOutlet weak var contentVIew: UIView!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func awakeFromNib() {
    super.awakeFromNib()
    setupCornerRadius()
  }

  func setupCornerRadius() {
    contentVIew.clipsToBounds = true
    contentVIew.layer.cornerRadius = 3
    contentVIew.layer.borderWidth = 0.2

  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
  }

  func configure(urlMedia: String, caption: String) {
    youtubeImageView.load(link: urlMedia)
    youtubeLabel.text = caption
  }



}
