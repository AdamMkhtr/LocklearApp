//
//  InstagramViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 24/09/2021.
//

import UIKit

class InstagramViewController: UIViewController {

  override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
  }

@IBOutlet weak var instagramTableView: UITableView!

}

//----------------------------------------------------------------------------
// MARK: - Extension Datasource table view
//----------------------------------------------------------------------------

extension InstagramViewController: UITableViewDataSource {
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
  return InstagramTableViewCell()
}


func numberOfSections(in tableView: UITableView) -> Int {
  return 1
}

func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
#warning("à update quand j'aurais crée l'array de photo")
  return 2
}
}
