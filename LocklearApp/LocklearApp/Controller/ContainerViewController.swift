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

@IBOutlet weak var sideMenuView: UIView!
@IBOutlet weak var sideNotificationContainer: UIView!
@IBOutlet weak var sideContainer: UIView!
@IBOutlet weak var baseContainerView: UIView!

//----------------------------------------------------------------------------
// MARK: - Init
//----------------------------------------------------------------------------

override func viewDidLoad() {
super.viewDidLoad()
configureAllMenuContainer()
configureStreamController()
setupSideMenu()
setupBaseContainer()
}

//----------------------------------------------------------------------------
// MARK: - Setup
//----------------------------------------------------------------------------

func setupSideMenu() {
homeController.didTapMenu = { [weak self] in
self?.sideContainer.isHidden = false
}
homeController.didTapNotification = { [weak self] in
self?.sideNotificationContainer.isHidden = false
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
sideContainer.isHidden = true
sideNotificationContainer.isHidden = true
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
sideMenuView.addSubview(homeController.view)
addChild(homeController)
homeController.didMove(toParent: self)

homeController.view.translatesAutoresizingMaskIntoConstraints = false

NSLayoutConstraint.activate([
homeController.view.topAnchor.constraint(equalTo: sideMenuView.topAnchor),
homeController.view.bottomAnchor.constraint(equalTo: sideMenuView.bottomAnchor),
homeController.view.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor),
homeController.view.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor),
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

func shadowHomeView() {
// à avoir comment faire
view.layer.shadowColor = UIColor.black.cgColor
view.layer.shadowOpacity = 1
view.layer.shadowOffset = .zero
view.layer.shadowRadius = 10
}

}


