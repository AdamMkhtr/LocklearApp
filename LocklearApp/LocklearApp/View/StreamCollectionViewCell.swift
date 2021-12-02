//
//  StreamCollectionViewCell.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 29/11/2021.
//

import UIKit

class StreamCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var hourLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    getDayOfWeek()
        // Initialization code
    }

  func getDayOfWeek() {
    let dayOfToday = Date().dayOfWeek()

    if dayOfToday == "Monday" && titleLabel.text == "Lun" {
      print("Lundi")
      titleLabel.textColor = UIColor.blue
    }
    else if dayOfToday == "Tuesday" && titleLabel.text == "Lun" {
      print("Mardi")
      titleLabel.textColor = UIColor.blue
    }
    else if dayOfToday == "Wednesday" && titleLabel.text == "Mer" {
      print("Mercredi")
      titleLabel.textColor = UIColor.blue
    }
    else if dayOfToday == "Thursday" && titleLabel.text == "Lun" {
      print("Jeudi")
      titleLabel.textColor = UIColor.blue
    }
    else if dayOfToday == "Friday" && titleLabel.text == "Lun" {
      print("Vendredi")
      titleLabel.textColor = UIColor.blue
    }
    else if dayOfToday == "Saturday" && titleLabel.text == "Lun" {
      print("Samedi")
      titleLabel.textColor = UIColor.blue
    }
    else if dayOfToday == "Sunday" && titleLabel.text == "Lun" {
      print("Dimanche")
      titleLabel.textColor = UIColor.blue
    }
  }

  
}
