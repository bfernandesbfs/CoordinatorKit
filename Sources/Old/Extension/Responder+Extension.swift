//
//  Responder+Extension.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

private var responderKey: UInt8 = 4

public extension Coordinator {

    var nextResponder: Responder? {
        get {
            return AssociatedObject.get(base: self, key: &responderKey)
        }
        set {
            AssociatedObject.set(base: self, key: &responderKey, value: newValue)
        }
    }
}
