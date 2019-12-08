//
//  UIViewController+Responder.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

private var controllerResponderKey: UInt8 = 0

public extension UIViewController {

    var responder: Responder? {
        get {
            return AssociatedObject.get(base: self, key: &controllerResponderKey)
        }
        set {
            AssociatedObject.set(base: self, key: &controllerResponderKey, value: newValue)
        }
    }

    public func set(responder: Responder) {
        self.responder = responder
    }

    public func set(controller: UIViewController) {
        self.responder = controller.responder
    }

    public func perform<EventType: Event>(action: EventType) {

        guard let responder = responder else {
            fatalError("\(self) does not have an associated match in chain structure")
        }

        responder.tryToHandle(action)
    }
}
