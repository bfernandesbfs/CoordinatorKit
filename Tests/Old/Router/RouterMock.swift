//
//  RouterMock.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/16/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit
import CoordinatorKit

public class RouterMock: Router {

    var navigationStack: [UIViewController] = []
    var presented: UIViewController?

    public init() {
        super.init(navigationController: NavigationViewController())
    }

    open override func present(_ module: Presentable, animated: Bool = true) {
        super.present(module, animated: animated)
        presented = module.toPresentable()
    }

    open override func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        super.dismissModule(animated: animated, completion: completion)
        presented = nil
    }

    open override func push(_ module: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {
        super.push(module, animated: animated, completion: completion)
        navigationStack.append(module.toPresentable())
    }

    open override func popModule(animated: Bool = true)  {
        super.popModule(animated: animated)
        navigationStack.removeLast()
    }

    open override func setRootModule(_ module: Presentable, hideBar: Bool = false) {
        super.setRootModule(module, hideBar: hideBar)
        navigationStack.append(module.toPresentable())
    }

    open override func popToRootModule(animated: Bool) {
        super.popToRootModule(animated: animated)

        guard let first = navigationStack.first else {
            return
        }
        navigationStack.removeAll()
        navigationStack = [first]
    }

}
