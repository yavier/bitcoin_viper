//
//  BitcoinProtocols.swift
//  VIPER
//
//  Created by yavito on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit

protocol BitcoinViewProtocol: LoadableViewController {
  var presenter: BitcoinPresenterProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> VIEW
   */

  func showRates()

  func showDefaultError()
}

protocol BitcoinWireFrameProtocol: class {
  static func presentBitcoinModule(fromView: AnyObject)
  /**
   * Add here your methods for communication PRESENTER -> WIREFRAME
   */

  func showDetail(fromView: AnyObject, _ rate: Rate)
}

protocol BitcoinPresenterProtocol: class {
  var view: BitcoinViewProtocol? { get set }
  var interactor: BitcoinInteractorInputProtocol? { get set }
  var wireFrame: BitcoinWireFrameProtocol? { get set }

  var rates: [Rate] { get }
  var filtered: [Rate] { get }
  /**
   * Add here your methods for communication VIEW -> PRESENTER
   */

  func fetchInformation()

  func showDetail(rate: Rate)

  func filterRatesBy(_ text: String)
}

protocol BitcoinInteractorOutputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> PRESENTER
   */

  func bitcoinLoaded(data: BitcoinData)
}

protocol BitcoinInteractorInputProtocol: class {
  var presenter: BitcoinInteractorOutputProtocol? { get set }
  var APIDataManager: BitcoinAPIDataManagerInputProtocol? { get set }
  var localDataManager: BitcoinLocalDataManagerInputProtocol? { get set }
  /**
   * Add here your methods for communication PRESENTER -> INTERACTOR
   */

  func fetchBitcoinRates()
}

protocol BitcoinAPIDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> APIDATAMANAGER
   */

  func callBitcoinAPI(completion: @escaping ((BitcoinData) -> Void))
}

protocol BitcoinLocalDataManagerInputProtocol: class {
  /**
   * Add here your methods for communication INTERACTOR -> LOCALDATAMANAGER
   */
}


protocol BitcoinRowReusable {
  static var identifier: String { get }

  func setup(_ rate: Rate?)
}


