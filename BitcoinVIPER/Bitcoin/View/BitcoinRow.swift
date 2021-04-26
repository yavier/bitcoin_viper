//
//  BitcoinRow.swift
//  BitcoinVIPER
//
//  Created by Francisco Javier Garcia Galvan on 12/02/21.
//

import UIKit


class BitcoinRow: UITableViewCell, BitcoinRowReusable {
  static var identifier: String { "BitcoinRow" }


  @IBOutlet weak var countryLabel: UILabel!
  @IBOutlet weak var rateLabel: UILabel!

  func setup(_ rate: Rate?) {
    countryLabel.text = rate?.country
    rateLabel.text = rate?.price
  }
}


protocol RowReusable {
  associatedtype Model
  static var identifier: String { get }

  func setup(_ model: Model?)
}

