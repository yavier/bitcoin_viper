//
//  ViewController.swift
//  BitcoinVIPER
//
//  Created by Francisco Javier Garcia Galvan on 12/02/21.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }


}

public protocol LoadableViewController: class {
  static var storyboardFileName: String { get }
  static var storyboardID: String { get }
}

public extension LoadableViewController where Self: UIViewController {

  static var storyboardID: String {
    return String(describing: self)
  }

  static func instantiate(from bundleName: String? = nil) -> Self {

    guard let vc = UIStoryboard.instanceofViewController(with: storyboardID, from: storyboardFileName, bundleName: bundleName) as? Self else {
      fatalError("The viewcontrolller '\(storyboardID)' of '\(storyboardFileName)' does not exists or does not a  '\(self)' class ")
    }
    return vc
  }
}

public extension UIStoryboard {

  class func instanceofViewController(with storyboardID: String, from storyboardFileName: String, bundleName: String? = nil) -> UIViewController? {
    var bundle: Bundle? = nil
    if let bundleNotNil = bundleName {
      bundle = Bundle(identifier: bundleNotNil)
    }
    let storyboard = UIStoryboard(
      name: storyboardFileName,
      bundle: bundle
    )

    return storyboard.instantiateViewController(withIdentifier: storyboardID)
  }
}


