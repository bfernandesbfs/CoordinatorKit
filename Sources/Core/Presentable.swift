//
//  Presentable.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public protocol Presentable {

    var viewController: UIViewController { get }
}

extension Presentable where Self: Coordinator {

    public var viewController: UIViewController {
        return rootViewController
    }

}

extension UIViewController: Presentable {

    public var viewController: UIViewController {
        return self
    }

}
