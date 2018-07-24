//  Copyright © 2018 Poikile Creations. All rights reserved.

import UIKit

/// A `UIView` that has outlets to an embedded collection view and table view,
/// only one of which is displayed at a given time, depending on screen
/// orientation and size.
open class CollectionAndTableDisplay: Display {

    public enum ForegroundMode: Int {
        case collection = 0
        case table
    }

    // MARK: - Public Properties

    open var foregroundMode: ForegroundMode {
        get {
            if tableView != nil && (foregroundView == nil || foregroundView === tableView) {
                return .table
            } else if collectionView != nil {
                return .collection
            } else {
                return .table
            }
        }

        set {
            if foregroundMode != newValue {
                switch newValue {
                case .table:
                    foregroundView = tableView
                case .collection:
                    foregroundView = collectionView
                }
            }
        }
    }

    open private(set) var foregroundView: UIView? {
        didSet {
            if foregroundView != nil {
                hide(oldValue)
                show(foregroundView)
            }
        }
    }

    open var indexPathForSelectedItem: IndexPath? {
        switch foregroundMode {
        case .collection where collectionView != nil:
            return collectionView?.indexPathsForSelectedItems?.first
        case .table where tableView != nil:
            return tableView?.indexPathForSelectedRow
        default:
            return nil
        }
    }

    open var indexPathsForSelectedItems: [IndexPath]? {
        switch foregroundMode {
        case .collection where collectionView != nil:
            return collectionView?.indexPathsForSelectedItems
        case .table where tableView != nil:
            return tableView?.indexPathsForSelectedRows
        default:
            return nil
        }
    }

    // MARK: - Outlets

    /// The `UICollectionView` that's contained in this view. It can be set
    /// only by connecting its outlet.
    @IBOutlet open private(set) weak var collectionView: UICollectionView? {
        didSet {
            if foregroundView == nil {
                foregroundView = collectionView
            }
        }
    }

    /// The `UITableView` that's contained in this view. It can be set only by
    /// connection its outlet.
    @IBOutlet open private(set) weak var tableView: UITableView? {
        didSet {
            if tableView != nil {
                foregroundView = tableView
            }
        }
    }

    // MARK: - Display
    
    /// Reload the data in the collection and table views. Subclasses should
    /// override this to update their models, and then call this superclass
    /// method.
    override open func refresh() {
        super.refresh()
        
        collectionView?.reloadData()
        tableView?.reloadData()
    }

    // MARK: - Public Functions

    open func toggleForegroundView() {
        if tableView != nil && collectionView != nil {
            if tableView === foregroundView {
                foregroundView = collectionView
            } else {
                foregroundView = tableView
            }
        } else {
            // Ignore it.
        }
    }

    // MARK: - Private Functions
    
    fileprivate func hide(_ view: UIView?) {
        if let view = view {
            view.isHidden = true
            sendSubview(toBack: view)
        }
    }

    fileprivate func show(_ view: UIView?) {
        if let view = view {
            bringSubview(toFront: view)
            view.isHidden = false
        }
    }

}
