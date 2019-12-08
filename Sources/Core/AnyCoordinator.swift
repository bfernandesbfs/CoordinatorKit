//
//  AnyCoordinator.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

private var childKey: UInt8 = 1
private var responderKey: UInt8 = 2

public protocol AnyCoordinator: Responder {}

extension AnyCoordinator {

    var _stack: Stack {
        return Stack(root: self)
    }

    var children: [AnyCoordinator] {
        get { return AssociatedObject.get(base: self, key: &childKey) { return [] } }
        set { AssociatedObject.set(base: self, key: &childKey, value: newValue) }
    }

    public var parent: AnyCoordinator? {
        get { return AssociatedObject.get(base: self, key: &responderKey) }
        set { AssociatedObject.set(base: self, key: &responderKey, value: newValue) }
    }
}
