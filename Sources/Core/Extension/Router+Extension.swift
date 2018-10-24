//
//  Router+Extension.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

private var routerKey: UInt8 = 3

public extension CoordinatorRouter {

    public func toPresentable() -> UIViewController {
        guard let controller = rootViewController else {
            fatalError("RootViewController isn't initialize")
        }
        return controller
    }
}

extension Coordinator {

    public var router: RouterType? {
        get { return AssociatedObject.get(base: self, key: &routerKey) }
        set { AssociatedObject.set(base: self, key: &routerKey, value: newValue) }
    }
}
