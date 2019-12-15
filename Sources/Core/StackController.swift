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
        children.append(element)
        root.registerParent(element)
    }

    @discardableResult
    public func pop() -> Presentable? {
        let element = children.popLast()
        return element
    }

    public func peek() -> Presentable? {
        return children.last
    }
}
