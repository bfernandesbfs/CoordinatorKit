//
//  EventSpec.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import Quick
import Nimble
@testable import CoordinatorKit

class EventSpec: QuickSpec {

    override func spec() {

        describe("EventSpec") {

            var responder: ObjectResponderTest!

            beforeEach {
                responder = ObjectResponderTest()
            }

            it("isAction") {
                responder.tryToHandle(TestAction.actionOne)
                expect(responder.isAction).to(beTrue())
            }

            it("action type") {
                responder.tryToHandle(TestAction.actionOne)
                expect(responder.action) == TestAction.actionOne
            }

            context("view controller", closure: {

                var controller: ResponderViewController!

                beforeEach {
                    controller = ResponderViewController()
                    controller.responder = responder
                }

                it("action type") {
                    controller.perform(action: TestAction.actionOne)
                    expect(responder.action) == TestAction.actionOne
                }

            })
        }
    }
}

class ResponderViewController: UIViewController {}
