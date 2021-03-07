//
//  BitcoinAPIDataManager.swift
//  VIPER
//
//  Created by yavito on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Combine

class BitcoinAPIDataManager: BitcoinAPIDataManagerInputProtocol {


  func callBitcoinAPI(completion: @escaping ((BitcoinData) -> Void)) {

    let url = URL(string: "https://api.coinbase.com/v2/exchange-rates?currency=BTC")!
    let urlRequest = URLRequest(url: url)
    URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
      guard let dataNotNil = data else {
        completion(BitcoinData(rates: []))
        return
      }

      let bitcoinData = try! JSONDecoder().decode(BitcoinData.self, from: dataNotNil)
      completion(bitcoinData)
    }.resume()
  }




}



