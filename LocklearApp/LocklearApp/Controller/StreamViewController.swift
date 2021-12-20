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

  var countdownTimer = Timer()
  let days = ["Lun","Mar","Mer","Jeu","Vend","Sam","Dim"]
  let dayOfToday = Date().dayOfWeek()

  //----------------------------------------------------------------------------
  // MARK: - Outlets
  //----------------------------------------------------------------------------

  @IBOutlet weak var rightView: UIView!
  @IBOutlet weak var leftView: UIView!
  @IBOutlet weak var dayTimerLabel: UILabel!
  @IBOutlet weak var hourTimerLabel: UILabel!
  @IBOutlet weak var minTimerLabel: UILabel!
  @IBOutlet weak var secTimerLabel: UILabel!
  @IBOutlet weak var calendarCollectionView: UICollectionView!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func viewDidLoad() {
    super.viewDidLoad()
    calendarCollectionView.delegate = self
    calendarCollectionView.dataSource = self
    calendarCollectionView.register(UINib(nibName:"StreamCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "StreamCell")
calendarCollectionView.isPagingEnabled = true
    startTimer()

    let tapGestureLeft = UITapGestureRecognizer()
    self.leftView.addGestureRecognizer(tapGestureLeft)
    tapGestureLeft.addTarget(self, action: #selector(clickLeft))
    let tapGestureRight = UITapGestureRecognizer()
    self.rightView.addGestureRecognizer(tapGestureRight)
    tapGestureRight.addTarget(self, action: #selector(clickRight))


    scrollToDayOfToday()
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  private func scrollToDayOfToday() {
    // Trouver index dans days du dayOfToday
    // Scroll at IndexPath ...
  }
  private func getLastVisibleIndexPath() -> IndexPath? {
    let visibleRect = CGRect(origin: calendarCollectionView.contentOffset,
                             size: calendarCollectionView.bounds.size)
    let visiblePoint = CGPoint(x: visibleRect.midX + (visibleRect.midX / 2), y: visibleRect.midY)
    return calendarCollectionView.indexPathForItem(at: visiblePoint)
  }

  @objc func clickRight() {
    guard let currentindexPath = getLastVisibleIndexPath() else  { return }
    let nextItem: IndexPath = IndexPath(row: currentindexPath.row + 1, section: currentindexPath.section)

    guard nextItem.row < days.count else {
      return
    }
    self.calendarCollectionView.scrollToItem(at: nextItem, at: .right, animated: true)
  }

  @objc func clickLeft() {
    guard let currentindexPath = getLastVisibleIndexPath() else  { return }
    let previousItem: IndexPath = IndexPath(row: currentindexPath.row - 1, section: currentindexPath.section)

    guard previousItem.row < days.count else {
      return
    }
    self.calendarCollectionView.scrollToItem(at: previousItem, at: .left, animated: true)
  }

  private var whatDate: TimeInterval {
    let todayDateStream =
    Calendar.current.date(bySettingHour: 20, minute: 30, second: 0, of: Date())!
    let today = Date()

    let tomorrow = Date.tomorrow
    let date =
    Calendar.current.date(bySettingHour: 20, minute: 30, second: 0, of: tomorrow)!

    guard today < todayDateStream else {
      let intervalTomorrow = date.timeIntervalSinceNow - today.timeIntervalSinceNow
      return intervalTomorrow
    }
    let intervalToday = todayDateStream.timeIntervalSinceNow - today.timeIntervalSinceNow
    return intervalToday
  }

  //----------------------------------------------------------------------------
  // MARK: - Timer
  //----------------------------------------------------------------------------

  func startTimer() {


    countdownTimer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(stringFromTimeInterval),
                                          userInfo: nil,
                                          repeats: true)
  }

  @objc func stringFromTimeInterval() -> String {
    let intervalle = whatDate
    let interval = Int(intervalle)
    let seconds = interval % 60
    let minutes = (interval / 60) % 60
    let hours = (interval / 3600) % 24
    let days = (interval / 86400)
    let stringTimer = String(format: "%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
    let stringDays = String(format: "%02d:", days)
    let stringHours = String(format: "%02d:", hours)
    let stringMin = String(format: "%02d:", minutes)
    let stringSec = String(format: "%02d", seconds)
    dayTimerLabel.text =  stringDays
    hourTimerLabel.text = stringHours
    minTimerLabel.text =  stringMin
    secTimerLabel.text =  stringSec
    return stringTimer
  }
}

//----------------------------------------------------------------------------
// MARK: - Extension CollectionView DataSource
//----------------------------------------------------------------------------

extension StreamViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let itemToShow = days[indexPath.row % days.count]
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StreamCell", for: indexPath) as? StreamCollectionViewCell else {
      print("Error create Cell")
      return UICollectionViewCell()
    }
    cell.titleLabel.text = itemToShow //[indexPath.item]


    // Trouver le jour de today
    let dayOfToday = Date().dayOfWeek()!
    if itemToShow == dayOfToday {
      cell.isCurrentDay = true
    }





    return cell
  }


  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return days.count * 10
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
  static var yesterday: Date { return Date().dayBefore }
  static var tomorrow:  Date { return Date().dayAfter }
  var dayBefore: Date {
    return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
  }
  var dayAfter: Date {
    return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
  }
  var noon: Date {
    return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
  }
  var month: Int {
    return Calendar.current.component(.month,  from: self)
  }
  var isLastDayOfMonth: Bool {
    return dayAfter.month != month
  }

  func dayOfWeek() -> String? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"

    return dateFormatter.string(from: self).capitalized

  }
}
