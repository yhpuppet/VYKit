//
//  TableViewController.swift
//  Vincent Yang
//
//  Created by Vincent Yang on 2019/7/7.
//  Copyright © 2019 Vincent Yang. All rights reserved.
//

import UIKit

open class TableViewController: PlainViewController {
  
  // MARK: - Initialization
    
  public init(style: UITableView.Style = .plain) {
    super.init()
    tableView = UITableView(frame: .zero, style: style)
  }
  
  // MARK: - View Lifecycle
  
  override open func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setUpTableView()
    setUpTableViewConstraints()
  }
  
  // MARK: - Set Up Subviews
  
  public var tableView: UITableView!
  
  /// Default `isActive` is `false`
  public var tableViewTopToViewTopLayoutConstraint: NSLayoutConstraint?
  /// Default `isActive` is `true`
  public var tableViewTopToViewSafeAreaLayoutGuideTopLayoutConstraint: NSLayoutConstraint?
  /// Default `isActive` is `true`
  public var tableViewBottomToViewBottomLayoutConstraint: NSLayoutConstraint?
  /// Default `isActive` is `false`
  public var tableViewBottomToViewSafeAreaLayoutGuideBottomLayoutConstraint: NSLayoutConstraint?
  
  
  /// Subclass can override this method for custom `tableView`
  /// Note: remember to add `tableView` to `view`
  public func setUpTableView() {
    tableView.contentInsetAdjustmentBehavior = .never
    view.addSubview(tableView)
  }
  
  public func setUpTableViewConstraints() {
    guard tableView.isDescendant(of: view) else {
      fatalError("TableView must be added into parent view first")
    }
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableViewTopToViewSafeAreaLayoutGuideTopLayoutConstraint =
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
    tableViewTopToViewSafeAreaLayoutGuideTopLayoutConstraint!.isActive = true
    // top to 'view' top layout constraint
    tableViewTopToViewTopLayoutConstraint = tableView.topAnchor.constraint(equalTo: view.topAnchor)
    
    tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    
    tableViewBottomToViewBottomLayoutConstraint = tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    tableViewBottomToViewBottomLayoutConstraint!.isActive = true
    // bottom to 'view.safeAreaLayoutGuide' bottom layout constraint
    tableViewBottomToViewSafeAreaLayoutGuideBottomLayoutConstraint =
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
  }
}
