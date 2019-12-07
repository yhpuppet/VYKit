//
//  ScrollViewController.swift
//  VYKit
//
//  Created by Vincent Yang on 2019/7/7.
//  Copyright © 2019 Vincent Yang. All rights reserved.
//

import UIKit

open class ScrollViewController: PlainViewController {
  
  // MARK: - Initialization
  
  public override init() {
    super.init()
  }
  
  // MARK: - View Lifecycle
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    setUpScrollView()
    setUpScrollViewConstraints()
    setUpScrollViewContentViewConstraints()
  }
  
  // MARK: - Set Up Scroll View
  
  open var scrollView = UIScrollView()
  open var scrollViewContentView = UIView()
  
  // MARK: Top
  /// Default `isActive` is `true`
  public var scrollViewTopToViewSafeAreaLayoutGuideTopLayoutConstraint: NSLayoutConstraint?
  /// Default `isActive` is `false`
  public var scrollViewTopToViewTopLayoutConstraint: NSLayoutConstraint?
  
  // MARK: Bottom
  /// Default `isActive` is `false`
  public var scrollViewBottomToViewSafeAreaLayoutGuideBottomLayoutConstraint: NSLayoutConstraint?
  /// Default `isActive` is `true`
  public var scrollViewBottomToViewBottomLayoutConstraint: NSLayoutConstraint?
  
  public func setUpScrollView() {
    scrollView.backgroundColor = .white
    scrollView.contentInsetAdjustmentBehavior = .never
    view.addSubview(scrollView)
    
    scrollViewContentView.backgroundColor = .white
    scrollView.addSubview(scrollViewContentView)
  }
  
  // MARK: - Set Up Scroll View Constraints
  
  public func setUpScrollViewConstraints() {
    guard scrollView.isDescendant(of: view) else {
      fatalError("ScrollView must be added into parent view first")
    }
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    
    // Top
    scrollViewTopToViewSafeAreaLayoutGuideTopLayoutConstraint =
      scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    scrollViewTopToViewSafeAreaLayoutGuideTopLayoutConstraint!.isActive = true
    scrollViewTopToViewTopLayoutConstraint =
      scrollView.topAnchor.constraint(equalTo: view.topAnchor)
    
    scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    
    // Bottom
    scrollViewBottomToViewSafeAreaLayoutGuideBottomLayoutConstraint =
      scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    scrollViewBottomToViewBottomLayoutConstraint =
      scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    scrollViewBottomToViewBottomLayoutConstraint!.isActive = true
  }
  
  public func setUpScrollViewContentViewConstraints() {
    guard scrollViewContentView.isDescendant(of: scrollView) else {
      fatalError("ScrollViewContentView must be added into parent view first")
    }
    scrollViewContentView.translatesAutoresizingMaskIntoConstraints = false
    
    scrollViewContentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
    scrollViewContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
    scrollViewContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
    scrollViewContentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    
    scrollViewContentView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
  }
}
