//
//  Coordinator.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public protocol Coordinator: AnyCoordinator, Presentable {

    associatedtype RootViewController: UIViewController

    var rootViewController: RootViewController { get }

    func router<Context>(_ context: Context) where Context: RouterContext, RootViewController == Context.RootViewController

}

extension Coordinator {

    public func router<Context>(_ context: Context) where Context: RouterContext, RootViewController == Context.RootViewController  {
        context.perform(rootViewController: rootViewController) { presentable in
            guard var coordinator = presentable as? AnyCoordinator else {
                return
            }

            if presentable.viewController !== self.rootViewController {
                coordinator.parent = self
                self._stack.push(coordinator)
            } else if let parent = coordinator.parent {
                parent._stack.pop()
            }
        }
    }
}


