//
//  ResponderSpec.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import Quick
import Nimble
@testable import CoordinatorKit

class ChainSpec: QuickSpec {

    override func spec() {

        describe("ChainSpec") {

            var rootResponder: RootResponderTest!
            var objectResponder: ObjectResponderTest!

            beforeEach {
                rootResponder = RootResponderTest()
                objectResponder = ObjectResponderTest()
                objectResponder.nextResponder = rootResponder
            }

            it("root isAction") {
                objectResponder.tryToHandle(AnotherTestAction.actionOne)
                expect(objectResponder.isAction).toNot(beTrue())
            }

            it("object isAction") {
                objectResponder.tryToHandle(TestAction.actionOne)
                expect(objectResponder.isAction).to(beTrue())
            }
        }
    }
}
