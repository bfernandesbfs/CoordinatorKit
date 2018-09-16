//
//  CoordinatorKitSpec.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 04/10/16.
//  Copyright © 2017 bfernandesbfs. All rights reserved.
//

import Quick
import Nimble
@testable import CoordinatorKit

class CoordinatorKitSpec: QuickSpec {

    override func spec() {

        describe("CoordinatorKitSpec") {
            it("works") {
                expect(CoordinatorKit.name) == "CoordinatorKit"
            }
        }

    }

}
