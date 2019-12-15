//
//  File.swift
//  
//
//  Created by Bruno Fernandes on 15/12/19.
//

import UIKit

public typealias NavigationTransition = Transition<UINavigationController>

extension Transition where RootViewController: UINavigationController {

    public static func push(_ presentable: Presentable, animation: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.pushViewController(presentable.viewController, animated: animation)
            completion?(false)
        }
    }

    public static func pop(animation: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, _, completion in
            rootViewController.popViewController(animated: animation)
            completion?(true)
        }
    }
}
