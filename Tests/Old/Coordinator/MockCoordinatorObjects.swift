//
//  MockCoordinatorObjects.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/16/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit
import CoordinatorKit

class TestCoordiantor: Coordinator, TestEventProtocol {

    var rootViewController: UIViewController?

    func start() {
        rootViewController = FirstViewController()
    }

    func handle(action: TestAction) {

        push(TestCoordiantor(), animated: false, completion: nil)

    }

}
