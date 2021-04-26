//
//  BitcoinInteractor.swift
//  VIPER
//
//  Created by Francisco Garcia on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Combine

class BitcoinInteractor: BitcoinInteractorInputProtocol {

  weak var presenter: BitcoinInteractorOutputProtocol?
  var APIDataManager: BitcoinAPIDataManagerInputProtocol?
  var localDataManager: BitcoinLocalDataManagerInputProtocol?

  var cancellables = Set<AnyCancellable>()

  func fetchBitcoinRates() {
    self.APIDataManager?.callBitcoinAPI()
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { (error) in

      }, receiveValue: { (bitcoinData) in
        self.presenter?.bitcoinLoaded(data: bitcoinData)
      }).store(in: &cancellables)
  }
}
