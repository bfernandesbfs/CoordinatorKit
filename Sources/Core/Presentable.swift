//
//  Presentable.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public typealias PresentationHandler = () -> Void

public protocol TransitionContext {

    var presentables: [Presentable] { get }
    
}

public protocol TransitionProtocol: TransitionContext {

    associatedtype RootViewController: UIViewController

    func perform(on rootViewController: RootViewController, completion: PresentationHandler?)
}

public protocol Presentable {

    var viewController: UIViewController! { get }

    func registerParent(_ presentable: Presentable)

}

extension Presentable {

    public func registerParent(_ presentable: Presentable) {}

}

extension UIViewController: Presentable {

    public var viewController: UIViewController! {
        return self
    }

    public func perform<EventType: Event>(action: EventType) {

        guard let responder = nextResponder?._stack.peek() as? AnyCoordinator else {
            fatalError("\(self) does not have an associated match in chain structure")
        }

        responder.tryToHandle(action)
    }
}
