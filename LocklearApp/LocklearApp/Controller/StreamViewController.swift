//
//  StreamViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 24/09/2021.
//

import UIKit

class StreamViewController: UIViewController {


  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------

  var releaseDate: NSDate?
  var countdownTimer = Timer()

  //----------------------------------------------------------------------------
  // MARK: - Outlets
  //----------------------------------------------------------------------------

  @IBOutlet weak var timerLabel: UILabel!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------
  override func viewDidLoad() {
    super.viewDidLoad()
    startTimer()
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  func startTimer() {

      let releaseDateString = "2021-11-29 08:00:00"
      let releaseDateFormatter = DateFormatter()
      releaseDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
      releaseDate = releaseDateFormatter.date(from: releaseDateString)! as NSDate

      countdownTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
  }

  @objc func updateTime() {

      let currentDate = Date()
      let calendar = Calendar.current

      let diffDateComponents = calendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: releaseDate! as Date)

      let countdown = " \(diffDateComponents.day ?? 0): \(diffDateComponents.hour ?? 0): \(diffDateComponents.minute ?? 0): \(diffDateComponents.second ?? 0)"
    timerLabel.text = countdown
  }

}
