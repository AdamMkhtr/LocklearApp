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

    let tapGestureLeft = UITapGestureRecognizer()
    self.leftView.addGestureRecognizer(tapGestureLeft)
    tapGestureLeft.addTarget(self, action: #selector(clickLeft))
    let tapGestureRight = UITapGestureRecognizer()
    self.rightView.addGestureRecognizer(tapGestureRight)
    tapGestureRight.addTarget(self, action: #selector(clickRight))
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  @objc func clickRight() {
    let visibleItems: NSArray = self.calendarCollectionView.indexPathsForVisibleItems as NSArray
      guard let currentItem: IndexPath = visibleItems.object(at: 0) as? IndexPath else { return }
    print("current \(currentItem)")
    let nextItem: IndexPath = IndexPath(item: currentItem.item + 1, section: 0)

    guard nextItem.row < days.count else {
      return
    }
    print("next \(nextItem)")
    print(currentItem)
    self.calendarCollectionView.scrollToItem(at: nextItem, at: .left, animated: true)
    print(currentItem)
  }

  @objc func clickLeft() {
    let visibleItems: NSArray = self.calendarCollectionView.indexPathsForVisibleItems as NSArray
    let currentItem: IndexPath = visibleItems.object(at: 0) as! IndexPath
    let nextItem: IndexPath = IndexPath(item: currentItem.item - 1, section: 0)
    if nextItem.row < days.count && nextItem.row >= 0{
        self.calendarCollectionView.scrollToItem(at: nextItem, at: .right, animated: true)

    }
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
    timerLabel.text = stringTimer
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



    //    dayOfToday
    //    if true {
    //      cell.isCurrentDay = true
    //    }


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
