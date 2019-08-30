//
//  CoordinatorSpec.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/16/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import Quick
import Nimble
@testable import CoordinatorKit

class CoordinatorSpec: QuickSpec {

    override func spec() {

        describe("CoordinatorSpec") {

            var coordinator: TestCoordinator!

            beforeEach {
                coordinator = TestCoordinator()
            }

            it("child initialized of empty array") {
                expect(coordinator.children.isEmpty).to(beTrue())
            }

            it("push new coordinator") {

                let newCoordinator = TestCoordinator()

                coordinator.push(newCoordinator, animated: false, completion: {})

                expect(coordinator.children.count) == 1
            }

            it("finish new coordinator") {

                var isCompletion: Bool = false
                let completion: () -> Void = {
                    isCompletion = true
                }
                let newCoordinator = TestCoordinator()

                coordinator.push(newCoordinator, animated: false, completion: nil)

                newCoordinator.finish(animated: false, completion: completion)

                expect(coordinator.children.isEmpty).to(beTrue())
                expect(isCompletion).to(beTrue())
            }
        }
    }
}
