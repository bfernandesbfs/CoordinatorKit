//
//  Presentable.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public protocol Presentable: AnyObject {

    var viewController: UIViewController! { get }

    func registerParent(_ presentable: Presentable)

    func setRoot(for window: UIWindow)
}

extension Presentable {

    internal func canBeRemovedAsChild() -> Bool {
        guard !(self is UIViewController) else {
            return true
        }

        guard let viewController = viewController else {
            return true
        }

        return !viewController.isInViewHierarchy && viewController.children.allSatisfy { $0.canBeRemovedAsChild() }
    }

    public func registerParent(_ presentable: Presentable) {}

    public func setRoot(for window: UIWindow) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    
    }

}

extension UIViewController: Presentable {

    internal var isInViewHierarchy: Bool {
        return isBeingPresented
            || presentingViewController != nil
            || presentedViewController != nil
            || parent != nil
            || view.window != nil
            || navigationController != nil
            || tabBarController != nil
            || splitViewController != nil
    }

    internal var topPresentedViewController: UIViewController {
        return presentedViewController?.topPresentedViewController ?? self
    }

    public var viewController: UIViewController! {
        return self
    }

    public func perform<EventType: Event>(action: EventType) {

        guard let responder = nextResponder else {
            fatalError("\(self) does not have an associated match in chain structure")
        }

        responder.tryToHandle(action)
    }
}
