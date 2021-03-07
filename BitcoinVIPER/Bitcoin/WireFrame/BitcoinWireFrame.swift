//
//  BitcoinWireFrame.swift
//  VIPER
//
//  Created by yavito on 02/12/2021.
//  Copyright © 2021 . All rights reserved.
//

import Foundation
import UIKit

class BitcoinWireFrame: BitcoinWireFrameProtocol {

  class func createBitcoinViewController() -> BitcoinViewController {
    return BitcoinViewController.instantiate()
  }

  class func presentBitcoinModule(fromView: AnyObject) {
    // Generating module components
    let view = createBitcoinViewController()
    let presenter: BitcoinPresenterProtocol & BitcoinInteractorOutputProtocol = BitcoinPresenter()
    let interactor: BitcoinInteractorInputProtocol = BitcoinInteractor()
    let APIDataManager: BitcoinAPIDataManagerInputProtocol = BitcoinAPIDataManager()
    let localDataManager: BitcoinLocalDataManagerInputProtocol = BitcoinLocalDataManager()
    let wireFrame: BitcoinWireFrameProtocol = BitcoinWireFrame()

    // Connecting
    view.presenter = presenter
    presenter.view = view
    presenter.wireFrame = wireFrame
    presenter.interactor = interactor
    interactor.presenter = presenter
    interactor.APIDataManager = APIDataManager
    interactor.localDataManager = localDataManager
    let navigationController = UINavigationController(rootViewController: view)
    (fromView as? UIWindow)?.rootViewController = navigationController
  }


  func showDetail(fromView: AnyObject, _ rate: Rate) {
    BitcoinDetailWireFrame.presentBitcoinDetailModule(fromView: fromView, with: rate)
  }
}
