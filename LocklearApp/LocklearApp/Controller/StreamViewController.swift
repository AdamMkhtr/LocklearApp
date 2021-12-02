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
  let days = ["Lun","Mar","Mer","Jeu","Vend","Sam","Dim"]

  //----------------------------------------------------------------------------
  // MARK: - Outlets
  //----------------------------------------------------------------------------

  @IBOutlet weak var timerLabel: UILabel!
  @IBOutlet weak var calendarCollectionView: UICollectionView!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func viewDidLoad() {
    super.viewDidLoad()
    calendarCollectionView.delegate = self
    calendarCollectionView.dataSource = self
    calendarCollectionView.register(UINib(nibName:"StreamCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StreamCell")
    startTimer()
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  func startTimer() {

    let releaseDateString = "2021-12-03 08:00:00"
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

//----------------------------------------------------------------------------
// MARK: - Extension CollectionView DataSource
//----------------------------------------------------------------------------

extension StreamViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StreamCell", for: indexPath) as? StreamCollectionViewCell else {
      print("Error create Cell")
      return UICollectionViewCell()
    }
      cell.titleLabel.text = days[indexPath.item]

      return cell
  }


  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return days.count
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
}

//----------------------------------------------------------------------------
// MARK: - Extension CollectionView Delegate
//----------------------------------------------------------------------------

extension StreamViewController : UICollectionViewDelegate {

}



extension Date {
    func dayOfWeek() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"

        return dateFormatter.string(from: self).capitalized
        // or use capitalized(with: locale) if you want
    }
}

