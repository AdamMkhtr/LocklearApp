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
    print("HELLO STREAM")
  }

  @objc func tapVideo() {
    print("HELLO Video")
  }

  @objc func tapInstagram() {
    print("HELLO Insta")
  }

  @objc func tapSong() {
    print("HELLO Song")
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------



}
