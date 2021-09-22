//
//  ContainerViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 21/09/2021.
//

import UIKit

class ContainerViewController: UIViewController {

//----------------------------------------------------------------------------
// MARK: - Properties
//----------------------------------------------------------------------------

let menuController = MenuViewController(nibName: nil, bundle: nil)
let homeController = HomeViewController(nibName: nil, bundle: nil)
let notificationController = NotificationSideMenuViewController(nibName: nil, bundle:   nil)

//----------------------------------------------------------------------------
// MARK: - Outlets
//----------------------------------------------------------------------------

@IBOutlet weak var sideMenuView: UIView!
@IBOutlet weak var sideNotificationContainer: UIView!
@IBOutlet weak var sideContainer: UIView!

//----------------------------------------------------------------------------
// MARK: - Init
//----------------------------------------------------------------------------

override func viewDidLoad() {
  super.viewDidLoad()
  configureHomeController()
  configureMenuController()
  configureNotificationController()
  setupSideMenu()
}

func setupSideMenu() {
  homeController.didTapMenu = { [weak self] in
    self?.sideContainer.isHidden = false
  }
  homeController.didTapNotification = { [weak self] in
    self?.sideNotificationContainer.isHidden = false
  }
}

//----------------------------------------------------------------------------
// MARK: - Methods
//----------------------------------------------------------------------------

@IBAction func dismissMenu(_ sender: Any) {
  sideContainer.isHidden = true
  sideNotificationContainer.isHidden = true
}

  //----------------------------------------------------------------------------
  // MARK: - Configure Container
  //----------------------------------------------------------------------------

func configureHomeController() {
  sideMenuView.addSubview(homeController.view)
  addChild(homeController)
  homeController.didMove(toParent: self)
}

func configureMenuController() {
  sideContainer.addSubview(menuController.view)
  addChild(menuController)
  menuController.didMove(toParent: self)
  menuController.view.translatesAutoresizingMaskIntoConstraints = false

  NSLayoutConstraint.activate([
    menuController.view.topAnchor.constraint(equalTo: sideContainer.topAnchor),
    menuController.view.bottomAnchor.constraint(equalTo: sideContainer.bottomAnchor),
    menuController.view.leadingAnchor.constraint(equalTo: sideContainer.leadingAnchor),
    menuController.view.trailingAnchor.constraint(equalTo: sideContainer.trailingAnchor),
  ])
}

  func configureNotificationController() {
    sideNotificationContainer.addSubview(notificationController.view)
    addChild(notificationController)
    notificationController.didMove(toParent: self)
    notificationController.view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      notificationController.view.topAnchor.constraint(equalTo: sideNotificationContainer.topAnchor),
      notificationController.view.bottomAnchor.constraint(equalTo: sideNotificationContainer.bottomAnchor),
      notificationController.view.leadingAnchor.constraint(equalTo: sideNotificationContainer.leadingAnchor),
      notificationController.view.trailingAnchor.constraint(equalTo: sideNotificationContainer.trailingAnchor),
    ])
  }

func shadowHomeView() {
// à avoir comment faire
  view.layer.shadowColor = UIColor.black.cgColor
  view.layer.shadowOpacity = 1
  view.layer.shadowOffset = .zero
  view.layer.shadowRadius = 10
}

}


