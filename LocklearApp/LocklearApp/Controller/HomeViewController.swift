//
//  HomeViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 14/09/2021.
//

import UIKit

class HomeViewController: UIViewController {

  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------

  var didTapMenu: (() -> Void)?
  var didTapNotification: (() -> Void)?

  //----------------------------------------------------------------------------
  // MARK: - Inits
  //----------------------------------------------------------------------------

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  //----------------------------------------------------------------------------
  // MARK: - Outlets
  //----------------------------------------------------------------------------

  @IBOutlet weak var StreamButton: UITabBarItem!

  @IBAction func menuButton(_ sender: Any) {
    didTapMenu?()
  }

  @IBAction func notificationButton(_ sender: Any) {
    didTapNotification?()
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------


}
