//
//  BitcoinViewController.swift
//  VIPER
//
//  Created by yavito on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit

class BitcoinViewController: UIViewController, BitcoinViewProtocol {

  static var storyboardFileName: String { "Main" }

  var presenter: BitcoinPresenterProtocol?

  @IBOutlet weak var tableView: UITableView!

  var searchController = UISearchController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    presenter?.fetchInformation()

//    let searchController = UISearchController(searchResultsController: nil)
    searchController.searchResultsUpdater = self
//    searchController.dimsBackgroundDuringPresentation = false
    searchController.searchBar.sizeToFit()
    searchController.hidesNavigationBarDuringPresentation = true

    tableView.tableHeaderView = searchController.searchBar
  }

  func showRates() {
    tableView.reloadData()
  }

  func showDefaultError() {
    let alert = UIAlertController(title: "Error", message: "No puedes comprar en este país", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Aceptar", style: .default, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }

}


extension BitcoinViewController: UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if searchController.isActive {
      return presenter?.filtered.count ?? 0
    }
    return presenter?.rates.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    guard let cell = tableView.dequeueReusableCell(withIdentifier: BitcoinRow.identifier) else {
      return UITableViewCell(style: .default, reuseIdentifier: "cell")
    }
    let rate = searchController.isActive ? presenter?.filtered[indexPath.row]: presenter?.rates[indexPath.row]
    (cell as? BitcoinRowReusable)?.setup(rate)

    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    guard let rateNotNil = searchController.isActive ? presenter?.filtered[indexPath.row]: presenter?.rates[indexPath.row] else {
      return
    }

    //Show detail
    searchController.dismiss(animated: false, completion: nil)
    presenter?.showDetail(rate: rateNotNil)
  }

}


extension BitcoinViewController: UISearchResultsUpdating {

  func updateSearchResults(for searchController: UISearchController) {
    presenter?.filterRatesBy(searchController.searchBar.text ?? "")
  }
}
