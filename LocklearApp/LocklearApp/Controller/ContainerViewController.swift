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
  let streamController = StreamViewController(nibName: nil, bundle: nil)
  let songController = SongViewController(nibName: nil, bundle: nil)
  let instagramController = InstagramViewController(nibName: nil, bundle: nil)
  let videoController = VideoViewController(nibName: nil, bundle: nil)

  //----------------------------------------------------------------------------
  // MARK: - Outlets
  //----------------------------------------------------------------------------

  @IBOutlet weak var menuView: UIView!
  @IBOutlet weak var sideNotificationContainer: UIView!
  @IBOutlet weak var sideContainer: UIView!
  @IBOutlet weak var baseContainerView: UIView!
  @IBOutlet weak var shadowView: UIView!
  @IBOutlet weak var leadingMenuConstraint: NSLayoutConstraint!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func viewDidLoad() {
    super.viewDidLoad()
    configureAllMenuContainer()
    configureStreamController()
    setupSideMenu()
    setupBaseContainer()
    animationDisapearRightMenu()
    animationDisapearNotificationMenu()
  }

  //----------------------------------------------------------------------------
  // MARK: - Animation side menu
  //----------------------------------------------------------------------------

  func animationDisapearRightMenu() {
    let screenWidth = UIScreen.main.bounds.width
    let disparear = CGAffineTransform(translationX: -screenWidth, y: 0)

    UIView.transition(with: self.view, duration: 0.33, options:
           [.curveEaseOut], animations: {
      self.sideContainer.transform = disparear
           }, completion: {_ in
       })
  }

  func animationDisapearNotificationMenu() {
    let screenWidth = UIScreen.main.bounds.width
    let disparear = CGAffineTransform(translationX: +screenWidth, y: 0)

    UIView.transition(with: self.view, duration: 0.33, options:
           [.curveEaseOut], animations: {
      self.sideNotificationContainer.transform = disparear
           }, completion: {_ in
       })
  }

  func animationAppearRightMenu() {
    if sideContainer.isHidden == true {
      sideContainer.isHidden = false
    }

    let identity = CGAffineTransform.identity

    UIView.transition(with: self.view, duration: 0.33, options:
           [.curveEaseOut], animations: {
      self.sideContainer.transform = identity
           }, completion: {_ in
       })
  }

  func animationAppearNotificationMenu() {
    if sideNotificationContainer.isHidden == true {
      sideNotificationContainer.isHidden = false
    }

    let identity = CGAffineTransform.identity

    UIView.transition(with: self.view, duration: 0.33, options:
           [.curveEaseOut], animations: {
      self.sideNotificationContainer.transform = identity
           }, completion: {_ in
       })
  }

  func shadowHomeView() {
    shadowView.isHidden = false
  }

  //----------------------------------------------------------------------------
  // MARK: - Setup
  //----------------------------------------------------------------------------

  func setupSideMenu() {
    homeController.didTapMenu = { [weak self] in

      self?.animationAppearRightMenu()
      self?.shadowHomeView()
    }

    homeController.didTapNotification = { [weak self] in

      self?.animationAppearNotificationMenu()
      self?.shadowHomeView()
    }
  }

  func setupBaseContainer() {
    homeController.didTapStream = { [weak self] in
      self?.configureStreamController()
    }
    homeController.didTapSong = { [weak self] in
      self?.configureSongController()
    }
    homeController.didTapInstagram = { [weak self] in
      self?.configureInstagramController()
    }
    homeController.didTapVideo = { [weak self] in
      self?.configureVideoController()
    }
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  @IBAction func dismissMenu(_ sender: Any) {
    animationDisapearRightMenu()
    animationDisapearNotificationMenu()
    shadowView.isHidden = true
  }

  //----------------------------------------------------------------------------
  // MARK: - Configure Container
  //----------------------------------------------------------------------------

  func configureAllMenuContainer() {
    configureHomeController()
    configureSideMenuController()
    configureNotificationController()
  }

  //----------------------------------------------------------------------------
  // MARK: - Top bar container
  //----------------------------------------------------------------------------

  func configureHomeController() {
    menuView.addSubview(homeController.view)
    addChild(homeController)
    homeController.didMove(toParent: self)

    homeController.view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      homeController.view.topAnchor.constraint(equalTo: menuView.topAnchor),
      homeController.view.bottomAnchor.constraint(equalTo: menuView.bottomAnchor),
      homeController.view.leadingAnchor.constraint(equalTo: menuView.leadingAnchor),
      homeController.view.trailingAnchor.constraint(equalTo: menuView.trailingAnchor),
    ])
  }

  //----------------------------------------------------------------------------
  // MARK: - Side menu container
  //----------------------------------------------------------------------------

  func configureSideMenuController() {
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

  //----------------------------------------------------------------------------
  // MARK: - Notification Container
  //----------------------------------------------------------------------------

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

  //----------------------------------------------------------------------------
  // MARK: - Stream Container
  //----------------------------------------------------------------------------

  func configureStreamController() {
    baseContainerView.addSubview(streamController.view)
    addChild(streamController)
    streamController.didMove(toParent: self)
    streamController.view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      streamController.view.topAnchor.constraint(equalTo: baseContainerView.topAnchor),
      streamController.view.bottomAnchor.constraint(equalTo: baseContainerView.bottomAnchor),
      streamController.view.leadingAnchor.constraint(equalTo: baseContainerView.leadingAnchor),
      streamController.view.trailingAnchor.constraint(equalTo: baseContainerView.trailingAnchor),
    ])
  }



  //----------------------------------------------------------------------------
  // MARK: - Song Container
  //----------------------------------------------------------------------------

  func configureSongController() {
    baseContainerView.addSubview(songController.view)
    addChild(songController)
    songController.didMove(toParent: self)
    songController.view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      songController.view.topAnchor.constraint(equalTo: baseContainerView.topAnchor),
      songController.view.bottomAnchor.constraint(equalTo: baseContainerView.bottomAnchor),
      songController.view.leadingAnchor.constraint(equalTo: baseContainerView.leadingAnchor),
      songController.view.trailingAnchor.constraint(equalTo: baseContainerView.trailingAnchor),
    ])
  }



  //----------------------------------------------------------------------------
  // MARK: - Instagram Container
  //----------------------------------------------------------------------------

  func configureInstagramController() {
    baseContainerView.addSubview(instagramController.view)
    addChild(instagramController)
    instagramController.didMove(toParent: self)
    instagramController.view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      instagramController.view.topAnchor.constraint(equalTo: baseContainerView.topAnchor),
      instagramController.view.bottomAnchor.constraint(equalTo: baseContainerView.bottomAnchor),
      instagramController.view.leadingAnchor.constraint(equalTo: baseContainerView.leadingAnchor),
      instagramController.view.trailingAnchor.constraint(equalTo: baseContainerView.trailingAnchor),
    ])
  }

  //----------------------------------------------------------------------------
  // MARK: - Video Container
  //----------------------------------------------------------------------------

  func configureVideoController() {
    baseContainerView.addSubview(videoController.view)
    addChild(videoController)
    videoController.didMove(toParent: self)
    videoController.view.translatesAutoresizingMaskIntoConstraints = false

    NSLayoutConstraint.activate([
      videoController.view.topAnchor.constraint(equalTo: baseContainerView.topAnchor),
      videoController.view.bottomAnchor.constraint(equalTo: baseContainerView.bottomAnchor),
      videoController.view.leadingAnchor.constraint(equalTo: baseContainerView.leadingAnchor),
      videoController.view.trailingAnchor.constraint(equalTo: baseContainerView.trailingAnchor),
    ])
  }



}


