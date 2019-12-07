//
//  PlainViewController.swift
//  VYKit
//
//  Created by Vincent Yang on 2019/7/7.
//  Copyright © 2019 Vincent Yang. All rights reserved.
//

import UIKit

open class PlainViewController: UIViewController {
  
  // MARK: - Initialization
  
  public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }
  
  public init() {
    super.init(nibName: nil, bundle: nil)
  }
  
  @available(*, unavailable)
  required public init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Root View
  
  override open func loadView() {
    view = UIView(frame: .zero)
    view.backgroundColor = .white
  }
  
}

// MARK: - Nav

extension PlainViewController {
  open func navBackUp(animated: Bool = true) {
    navigationController?.popViewController(animated: animated)
  }
  
  open func navTo(_ viewController: UIViewController, animated: Bool = true) {
    navigationController?.pushViewController(viewController, animated: animated)
  }
}


