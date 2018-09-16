//
//  MockObjects.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import CoordinatorKit

class RootResponderTest: Responder, AnotherTestEventProtocol {

    var nextResponder: Responder?

    var action: AnotherTestAction?

    var isAction: Bool {
        return action != nil
    }

    func handle(action: AnotherTestAction) {
        self.action = action
    }
}

class ObjectResponderTest: Responder, TestEventProtocol {

    var nextResponder: Responder?

    var action: TestAction?

    var isAction: Bool {
        return action != nil
    }

    func handle(action: TestAction) {
        self.action = action
    }
}
