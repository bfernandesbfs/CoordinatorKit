//
//  RouterContext.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public typealias PerformClosure = (_ presentable: Presentable) -> Void

public protocol RouterContext {

    associatedtype RootViewController: UIViewController

    func perform(rootViewController: RootViewController, perform: @escaping PerformClosure)
}

public enum ViewContext: RouterContext {

    case present(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?)
    case dismiss(_ presentable: Presentable, animated: Bool, completion: (() -> Void)?)

    public var parent: Presentable? {
        switch self {
        case let .present(presentable, _, _):
            return presentable
        case let .dismiss(presentable, _, _):
        return presentable
        }
    }

    public func perform(rootViewController: UIViewController, perform: @escaping PerformClosure) {

        switch self {
        case let .present(presentable, animated, completion):

            rootViewController.present(presentable.viewController, animated: animated, completion: completion)

            perform(presentable)

        case let .dismiss(presentable, animated, completion):
            rootViewController.dismiss(animated: animated) {
                completion?()
                perform(presentable)
            }
        }
    }
}

public enum NavigationContext: RouterContext {

    case push(_ presentable: Presentable, animated: Bool)

    public var parent: Presentable? {
        switch self {
        case let .push(presentable, _):
            return presentable
        }
    }

    public func perform(rootViewController: UINavigationController, perform: @escaping PerformClosure) {

        switch self {
        case let .push(presentable, animated):

            rootViewController.pushViewController(presentable.viewController, animated: animated)
            perform(presentable)
        }
    }
}
