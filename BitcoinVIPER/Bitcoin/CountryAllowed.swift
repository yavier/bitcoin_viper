//
//  CountryAllowed.swift
//  BitcoinVIPER
//
//  Created by Francisco Javier Garcia Galvan on 13/02/21.
//

import UIKit

enum CountryAllowed: String {
  case mxn = "MXN"
  case arg = "ARS"
  case cop = "COP"
  
  var defaultColor: UIColor {
    switch self {
    case .mxn:
      return UIColor.green
    case .arg:
      return UIColor.blue
    case .cop:
      return UIColor.yellow
    }
  }
}
