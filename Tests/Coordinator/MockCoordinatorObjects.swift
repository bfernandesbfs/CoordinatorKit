//
//  MockCoordinatorObjects.swift
//  CoordinatorKit
//
//  Created by Bruno Fernandes on 9/16/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit
import CoordinatorKit

class TestCoordinator: Coordinator, TestEventProtocol {
    
    func start() {
        rootViewController = FirstViewController()
    }

    func handle(action: TestAction) {

        push(TestCoordinator(), animated: false, completion: nil)

    }

}
