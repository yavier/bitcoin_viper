//
//  BitcoinInteractor.swift
//  VIPER
//
//  Created by yavito on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation

class BitcoinInteractor: BitcoinInteractorInputProtocol {

  weak var presenter: BitcoinInteractorOutputProtocol?
  var APIDataManager: BitcoinAPIDataManagerInputProtocol?
  var localDataManager: BitcoinLocalDataManagerInputProtocol?


  func fetchBitcoinRates() {
    self.APIDataManager?.callBitcoinAPI { [weak self] bitcoinData in
      DispatchQueue.main.async {
        self?.presenter?.bitcoinLoaded(data: bitcoinData)
      }
    }
  }
}
