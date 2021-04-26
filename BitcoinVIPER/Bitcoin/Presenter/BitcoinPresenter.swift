//
//  BitcoinPresenter.swift
//  VIPER
//
//  Created by Francisco Garcia on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import Combine

class BitcoinPresenter: BitcoinPresenterProtocol, BitcoinInteractorOutputProtocol {
  weak var view: BitcoinViewProtocol?
  var interactor: BitcoinInteractorInputProtocol?
  var wireFrame: BitcoinWireFrameProtocol?

  var rates: [Rate] = [] {
    didSet {
      self.view?.showRates()
    }
  }

  var filtered: [Rate] = [] {

    didSet {
      self.view?.showRates()
    }
  }

  func fetchInformation() {
    self.interactor?.fetchBitcoinRates()
  }

  func bitcoinLoaded(data: BitcoinData) {
    self.rates = data.rates
  }

  func showDetail(rate: Rate) {

    if rate.isAllowed() {
      wireFrame?.showDetail(fromView: self.view!, rate)
    } else {
      view?.showDefaultError()
    }
  }

  func filterRatesBy(_ text: String) {
    filtered = rates.filter { text.isEmpty ? true: $0.country.contains(text.uppercased()) }
  }

}
