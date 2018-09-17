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

            var coordinator: TestCoordiantor!

            beforeEach {
                coordinator = TestCoordiantor()
            }

            it("child initialized of empty array") {
                expect(coordinator.childCoordinators.isEmpty).to(beTrue())
            }

            it("push new coordinator") {

                var isCompletion: Bool = false
                let completion: () -> Void = {
                    isCompletion = true
                }
                let newCoordinator = TestCoordiantor()

                coordinator.push(newCoordinator, animated: false, completion: completion)

                expect(coordinator.childCoordinators.count) == 1
                expect(isCompletion).to(beTrue())
            }

            it("finish new coordinator") {

                var isCompletion: Bool = false
                let completion: () -> Void = {
                    isCompletion = true
                }
                let newCoordinator = TestCoordiantor()

                coordinator.push(newCoordinator, animated: false, completion: nil)

                newCoordinator.finish(animated: false, completion: completion)

                expect(coordinator.childCoordinators.isEmpty).to(beTrue())
                expect(isCompletion).to(beTrue())
            }
        }
    }
}
