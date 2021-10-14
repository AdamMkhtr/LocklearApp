//
//  InstagramViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 24/09/2021.
//

import UIKit

class InstagramViewController: UIViewController {


//----------------------------------------------------------------------------
// MARK: - Properties
//----------------------------------------------------------------------------

var instagramDetailsConverter = InstagramDetailsConverter()

//----------------------------------------------------------------------------
// MARK: - Outlets
//----------------------------------------------------------------------------

@IBOutlet weak var instagramTableView: UITableView!

//----------------------------------------------------------------------------
// MARK: - Init
//----------------------------------------------------------------------------

override func viewDidLoad() {
super.viewDidLoad()
self.instagramTableView.register(UINib(nibName: "InstagramTableViewCell", bundle: nil), forCellReuseIdentifier: "InstagramCell")
  lauchRequest()
}

//----------------------------------------------------------------------------
// MARK: - Methods
//----------------------------------------------------------------------------

func lauchRequest() {
  print("lauch request")
    instagramDetailsConverter.collectDetailsPictures() { [weak self]  in
      print("reload")
      self?.instagramTableView.reloadData()
      
    }
  print("fin de l'action")
}

}
//----------------------------------------------------------------------------
// MARK: - Extension Datasource table view
//----------------------------------------------------------------------------

extension InstagramViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
guard let cell = tableView.dequeueReusableCell(withIdentifier: "InstagramCell", for: indexPath) as? InstagramTableViewCell else {
print("Error create Cell")
return UITableViewCell()
}
let pictureDetail = instagramDetailsConverter.detailsPictures[indexPath.row]

cell.configure(urlMedia: pictureDetail.mediaURL, caption: pictureDetail.caption ?? "")

return cell
}

func numberOfSections(in tableView: UITableView) -> Int {
return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
return instagramDetailsConverter.detailsPictures.count
}
}
