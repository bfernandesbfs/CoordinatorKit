//
//  Router+Extension.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public extension CoordinatorRouter {

    public func toPresentable() -> UIViewController {
        guard let controller = rootViewController else {
            fatalError("RootViewController isn't initialize")
        }
        return controller
    }
}
