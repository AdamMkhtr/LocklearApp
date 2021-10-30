//
//  VideoViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 24/09/2021.
//

import UIKit

class VideoViewController: UIViewController {


  //----------------------------------------------------------------------------
  // MARK: - Properties
  //----------------------------------------------------------------------------

  var youtubeConverter = YoutubeConverter()

  //----------------------------------------------------------------------------
  // MARK: - Outlets
  //----------------------------------------------------------------------------

  @IBOutlet weak var youtubeTableView: UITableView!

  //----------------------------------------------------------------------------
  // MARK: - Init
  //----------------------------------------------------------------------------

  override func viewDidLoad() {
    super.viewDidLoad()
    print("ça commence youtube")
    self.youtubeTableView.register(UINib(nibName: "YoutubeTableViewCell", bundle: nil), forCellReuseIdentifier: "YoutubeCell")
    lauchRequest()
    youtubeTableView.delegate = self
    youtubeTableView.dataSource = self
    youtubeTableView.allowsSelection = true
  }

  //----------------------------------------------------------------------------
  // MARK: - Methods
  //----------------------------------------------------------------------------

func lauchRequest() {
  youtubeConverter.convert() { [weak self] result in
    self?.youtubeTableView.reloadData()

  }
}

}

//----------------------------------------------------------------------------
// MARK: - Extension Datasource table view
//----------------------------------------------------------------------------

extension VideoViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "InstagramCell", for: indexPath) as? InstagramTableViewCell else {
      print("Error create Cell")
      return UITableViewCell()
    }
    let videoDetail = youtubeConverter.videoDetails[indexPath.row]

    cell.configure(urlMedia: videoDetail.snippet.title, caption: videoDetail.snippet.thumbnails.thumbnailsDefault.url)

    return cell
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return youtubeConverter.videoDetails.count
  }
}

//----------------------------------------------------------------------------
// MARK: - Extension UITableViewDelegate
//----------------------------------------------------------------------------

extension VideoViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let indexPathYoutube = youtubeTableView.indexPathForSelectedRow?.row else {
      print("error index path Favorite table view")
      return
    }
    let selectedPicture = youtubeConverter.videoDetails[indexPathYoutube]

    let url = "https://www.youtube.com/watch?v=" + selectedPicture.id.videoID

    guard let url = URL(string: url) else {
      print("error URL")
      return
    }
    UIApplication.shared.open(url)
    print("ici")

  }


}
