//
//  BitcoinAPIDataManager.swift
//  VIPER
//
//  Created by Francisco Garcia on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Combine

class BitcoinAPIDataManager: BitcoinAPIDataManagerInputProtocol {

  func callBitcoinAPI() -> AnyPublisher<BitcoinData, Error> {

    let url = URL(string: "https://api.coinbase.com/v2/exchange-rates?currency=BTC")!
    let urlRequest = URLRequest(url: url)

    return URLSession.shared.dataTaskPublisher(for: urlRequest)
      .tryMap { data, response in
        try JSONDecoder().decode(BitcoinData.self, from: data)
      }
      .eraseToAnyPublisher()
  }

}



