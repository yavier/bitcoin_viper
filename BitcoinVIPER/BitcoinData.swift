//
//  BitcoinData.swift
//  BitcoinVIPER
//
//  Created by Francisco Javier Garcia Galvan on 12/02/21.
//

import Foundation

struct Rate: Identifiable {
  let country: String
  let price: String
  let id = UUID()
}

extension Rate {
  func isAllowed() -> Bool {
    return CountryAllowed(rawValue: country) != nil
  }
}

struct BitcoinData {
  let rates: [Rate]

  enum CodingKeys: String, CodingKey {
    case data
  }

  enum DataKeys: String, CodingKey {
    case rates
  }

}

extension BitcoinData: Decodable {
  init(from decoder: Decoder) throws {

    // Extract the top-level values ("user")
    let values = try decoder.container(keyedBy: CodingKeys.self)

    // Extract the user object as a nested container
    let rates = try values.nestedContainer(keyedBy: DataKeys.self, forKey: .data)

    // Extract each property from the nested container
    self.rates = try rates.decode([String: String].self, forKey: .rates)
      .map(Rate.init)
  }
}

