//
//  BitcoinAPIDataManager.swift
//  VIPER
//
//  Created by Francisco Garcia on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Combine

enum BitcoinFetchError: LocalizedError {

  case urlNotValid
}

class BitcoinAPIDataManager: BitcoinAPIDataManagerInputProtocol {

  func callBitcoinAPI() -> AnyPublisher<BitcoinData, Error> {

    guard let url = URL(string: "https://api.coinbase.com/v2/exchange-rates?currency=BTC") else {
      return Fail(error: BitcoinFetchError.urlNotValid).eraseToAnyPublisher()
    }

    let urlRequest = URLRequest(url: url)
    return URLSession.shared.dataTaskPublisher(for: urlRequest)
      .map(\.data)
      .decode(type: BitcoinData.self, decoder: JSONDecoder())
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }

}



