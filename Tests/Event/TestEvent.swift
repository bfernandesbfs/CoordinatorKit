//
//  TestEvent.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import CoordinatorKit

public protocol TestEventProtocol {
    func handle(action: TestAction)
}

public enum TestAction: Event {

    case actionOne, actionTwo

    public func sendToHandler(_ handler: TestEventProtocol) {
        handler.handle(action: self)
    }
}

public protocol AnotherTestEventProtocol {
    func handle(action: AnotherTestAction)
}

public enum AnotherTestAction: Event {

    case actionOne, actionTwo

    public func sendToHandler(_ handler: AnotherTestEventProtocol) {
        handler.handle(action: self)
    }
}
