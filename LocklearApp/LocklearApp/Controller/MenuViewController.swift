//
//  MenuViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 14/09/2021.
//

import UIKit

class MenuViewController: UIViewController {


//----------------------------------------------------------------------------
// MARK: - Properties
//----------------------------------------------------------------------------

@IBOutlet weak var shopView: UIView!
@IBOutlet weak var officialSiteView: UIView!
@IBOutlet weak var youtubeView: UIView!
@IBOutlet weak var twitchView: UIView!
@IBOutlet weak var twitterView: UIView!
@IBOutlet weak var instagramView: UIView!
@IBOutlet weak var discordView: UIView!

//----------------------------------------------------------------------------
// MARK: - Setup
//----------------------------------------------------------------------------

override func viewDidLoad() {
  super.viewDidLoad()
  setupTapGestureRecognizer()
  setupView()
}

  func setupView() {
    setupShop()
    setupOfficialSite()
    setupYoutube()
    setupTwitch()
    setupTwitter()
    setupInstagram()
    setupDiscord()
  }

  func setupShop() {
    shopView.layer.cornerRadius = 8
    shopView.layer.borderWidth = 0.5
  }

  func setupOfficialSite() {
    officialSiteView.layer.cornerRadius = 8
    officialSiteView.layer.borderWidth = 0.5
  }

  func setupYoutube() {
    youtubeView.clipsToBounds = true
    youtubeView.layer.cornerRadius = 8
    youtubeView.layer.borderWidth = 0.5
  }

  func setupTwitch() {
    twitchView.clipsToBounds = true
    twitchView.layer.cornerRadius = 8
    twitchView.layer.borderWidth = 0.5
  }

  func setupTwitter() {
    twitterView.clipsToBounds = true
    twitterView.layer.cornerRadius = 8
    twitterView.layer.borderWidth = 0.5
  }

  func setupInstagram() {
    instagramView.clipsToBounds = true
    instagramView.layer.cornerRadius = 8
    instagramView.layer.borderWidth = 0.5
  }

  func setupDiscord() {
    discordView.clipsToBounds = true
    discordView.layer.cornerRadius = 8
    discordView.layer.borderWidth = 0.5
  }


func setupTapGestureRecognizer() {
let tapGestureShop = UITapGestureRecognizer()
self.shopView.addGestureRecognizer(tapGestureShop)
  tapGestureShop.addTarget(self, action: #selector(tapShop))

let tapGestureOfficialSite = UITapGestureRecognizer()
self.officialSiteView.addGestureRecognizer(tapGestureOfficialSite)
  tapGestureOfficialSite.addTarget(self, action: #selector(tapOfficialSite))

let tapGestureYoutube = UITapGestureRecognizer()
self.youtubeView.addGestureRecognizer(tapGestureYoutube)
tapGestureYoutube.addTarget(self, action: #selector(tapYoutube))

let tapGestureTwitch = UITapGestureRecognizer()
self.twitchView.addGestureRecognizer(tapGestureTwitch)
  tapGestureTwitch.addTarget(self, action: #selector(tapTwitch))

let tapGestureTwitter = UITapGestureRecognizer()
self.twitterView.addGestureRecognizer(tapGestureTwitter)
  tapGestureTwitter.addTarget(self, action: #selector(tapTwitter))

let tapGestureInstagram = UITapGestureRecognizer()
self.instagramView.addGestureRecognizer(tapGestureInstagram)
  tapGestureInstagram.addTarget(self, action: #selector(tapInstagram))

let tapGestureDiscord = UITapGestureRecognizer()
self.discordView.addGestureRecognizer(tapGestureDiscord)
  tapGestureDiscord.addTarget(self, action: #selector(tapDiscord))
}

//----------------------------------------------------------------------------
// MARK: - Methods
//----------------------------------------------------------------------------

  @objc func tapShop() {
    let urlShop = "https://shop.locklear.fr"
    guard let url = URL(string: urlShop) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
  }

  @objc func tapOfficialSite() {
    let urlOfficialSite = "https://locklear.fr"
    guard let url = URL(string: urlOfficialSite) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
  }

  @objc func tapYoutube() {
    let urlYoutube = "https://www.youtube.com/user/L0ckl34r"
    guard let url = URL(string: urlYoutube) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
  }

  @objc func tapTwitch() {
    let urlTwitch = "https://www.twitch.tv/locklear"
    guard let url = URL(string: urlTwitch) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
  }

  @objc func tapTwitter() {
    let urlTwitter = "https://twitter.com/Lockl34r"
    guard let url = URL(string: urlTwitter) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
  }

  @objc func tapInstagram() {
    let urlInstagram = "https://www.instagram.com/esl_locklear/"
    guard let url = URL(string: urlInstagram) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
  }

  @objc func tapDiscord() {
    let urlDiscord = "https://discord.com/invite/locklear"
    guard let url = URL(string: urlDiscord) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
  }

}
