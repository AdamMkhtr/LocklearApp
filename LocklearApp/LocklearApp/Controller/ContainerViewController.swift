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

  @IBOutlet weak var sideMenuView: UIView!

  @IBOutlet weak var sideContainer: UIView!
  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func viewDidLoad() {
    super.viewDidLoad()
    configureHomeController()
    configureMenuController()
    setup()
  }

  func setup() {
    homeController.didTapMenu = { [weak self] in
      self?.sideContainer.isHidden = false
    }
  }
  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  @IBAction func dismissMenu(_ sender: Any) {
    sideContainer.isHidden = true
  }

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

  func shadowHomeView() {
// à avoir comment faire
    view.layer.shadowColor = UIColor.black.cgColor
    view.layer.shadowOpacity = 1
    view.layer.shadowOffset = .zero
    view.layer.shadowRadius = 10
  }

}


