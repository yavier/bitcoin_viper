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



class MovementRow: UITableViewCell, RowReusable {

  typealias Model = Movement

  static var identifier: String { "MovementRow" }


  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var merchantLabel: UILabel!

  func setup(_ model: Model?) {

    let formatter = NumberFormatter()
    formatter.numberStyle = .currency
    formatter.currencySymbol = "$ "
    amountLabel.text = formatter.string(from: NSDecimalNumber(string: model?.amount))
    dateLabel.text = model?.date
    merchantLabel.text = model?.merchant
  }
}
