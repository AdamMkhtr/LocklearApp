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
  var didTapStream: (() -> Void)?
  var didTapVideo: (() -> Void)?
  var didTapInstagram: (() -> Void)?
  var didTapSong: (() -> Void)?

  //----------------------------------------------------------------------------
  // MARK: - Outlets
  //----------------------------------------------------------------------------
  @IBOutlet weak var streamBarView: UIView!
  @IBOutlet weak var videoBarView: UIView!
  @IBOutlet weak var instagramBarView: UIView!
  @IBOutlet weak var songBarView: UIView!

  //----------------------------------------------------------------------------
  // MARK: - Inits
  //----------------------------------------------------------------------------

  override func viewDidLoad() {
    super.viewDidLoad()
    setupTapGestureRecognizer()
    tapStream()
  }

  func setupTapGestureRecognizer() {
    let tapGestureStream = UITapGestureRecognizer()
    self.streamBarView.addGestureRecognizer(tapGestureStream)
    tapGestureStream.addTarget(self, action: #selector(tapStream))

    let tapGestureVideo = UITapGestureRecognizer()
    self.videoBarView.addGestureRecognizer(tapGestureVideo)
    tapGestureVideo.addTarget(self, action: #selector(tapVideo))

    let tapGestureInstagram = UITapGestureRecognizer()
    self.instagramBarView.addGestureRecognizer(tapGestureInstagram)
    tapGestureInstagram.addTarget(self, action: #selector(tapInstagram))

    let tapGestureSong = UITapGestureRecognizer()
    self.songBarView.addGestureRecognizer(tapGestureSong)
    tapGestureSong.addTarget(self, action: #selector(tapSong))
  }

  //----------------------------------------------------------------------------
  // MARK: - Action
  //----------------------------------------------------------------------------


  @IBAction func menuButtonTapped(_ sender: Any) {
    didTapMenu?()
  }

  @IBAction func notificationButtonTapped(_ sender: Any) {
    didTapNotification?()
  }

  //----------------------------------------------------------------------------
  // MARK: - OBJC Mehtods
  //----------------------------------------------------------------------------

  @objc func tapStream() {
    recolorAllView()
    streamBarView.backgroundColor = #colorLiteral(red: 0.07869828492, green: 0.0981830731, blue: 0.1287542284, alpha: 1)
    didTapStream?()
  }

  @objc func tapVideo() {
    recolorAllView()
    videoBarView.backgroundColor = #colorLiteral(red: 0.07869828492, green: 0.0981830731, blue: 0.1287542284, alpha: 1)
    didTapVideo?()
  }
  
  @objc func tapInstagram() {
    recolorAllView()
    instagramBarView.backgroundColor = #colorLiteral(red: 0.07869828492, green: 0.0981830731, blue: 0.1287542284, alpha: 1)
    didTapInstagram?()
  }

  @objc func tapSong() {
    recolorAllView()
    songBarView.backgroundColor = #colorLiteral(red: 0.07869828492, green: 0.0981830731, blue: 0.1287542284, alpha: 1)
    didTapSong?()
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

  private func recolorAllView() {
    let selectedViews: [UIView] =
    [streamBarView, videoBarView, instagramBarView, songBarView]
    for selectedView in selectedViews {
      selectedView.backgroundColor = #colorLiteral(red: 0.1254901961, green: 0.1607843137, blue: 0.2117647059, alpha: 1)
    }
  }

}
