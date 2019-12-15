//
//  Stack.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import Foundation

public class StackController {

    private var root: Presentable

    public private(set) var children: [Presentable]

    init(root: Presentable) {
        self.root = root
        self.children = []
    }

    public func push(_ element: Presentable) {
        if element is AnyCoordinator {
            children.append(element)
            root.registerParent(element)
        }
    }

    public func pop(_ element: Presentable) {
        children.removeAll {
            $0.canBeRemovedAsChild()
        }
    }

    public func peek() -> Presentable? {
        return children.last
    }
}
