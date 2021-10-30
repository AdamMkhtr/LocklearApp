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

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func awakeFromNib() {
    super.awakeFromNib()
  //    contentView.isUserInteractionEnabled = true
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  override func setSelected(_ selected: Bool, animated: Bool) {
      super.setSelected(selected, animated: animated)

  }

    

  func configure(urlMedia: String, caption: String) {
    pictureImageView.load(link: urlMedia)
    captionPictureLabel.text = caption
  //  contentView.isUserInteractionEnabled = true
  }

  }
