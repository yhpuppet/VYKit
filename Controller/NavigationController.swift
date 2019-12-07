//
//  NavigationController.swift
//  Vincent Yang
//
//  Created by Vincent Yang on 2019/7/7.
//  Copyright © 2019 Vincent Yang. All rights reserved.
//

import UIKit

open class NavigationController: UINavigationController {
  
  // MARK: - View Lifecycle
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    interactivePopGestureRecognizer?.delegate = self
  }
  
  // MARK: -
  
  override open var childForStatusBarStyle: UIViewController? {
    return visibleViewController
  }
}

// MARK: - UIGestureRecognizerDelegate

extension NavigationController: UIGestureRecognizerDelegate {
  public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
    if gestureRecognizer == interactivePopGestureRecognizer {
      return children.count > 1
    }
    return true
  }
}
