//
//  Stack.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import Foundation

public class Stack {

    private var root: AnyCoordinator

    init(root: AnyCoordinator) {
        self.root = root
    }

    public func push(_ element: AnyCoordinator) {
        root.children.append(element)
    }

    @discardableResult
    public func pop() -> AnyCoordinator? {
        return root.children.popLast()
    }

    public func peek() -> AnyCoordinator? {
        return root.children.last
    }
}
