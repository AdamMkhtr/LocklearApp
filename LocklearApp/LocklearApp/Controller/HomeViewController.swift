//
//  HomeViewController.swift
//  LocklearApp
//
//  Created by Adam Mokhtar on 14/09/2021.
//

import UIKit

class HomeViewController: UIViewController {

  var didTapMenu: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
    }


  @IBAction func menuButton(_ sender: Any) {
    didTapMenu?()
  }


}
