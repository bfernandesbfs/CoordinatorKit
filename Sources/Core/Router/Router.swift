//
//  Router.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

open class Router: NSObject, RouterType {

    private var completions: [UIViewController : () -> Void]

    public let navigationController: UINavigationController
    
    public var rootViewController: UIViewController? {
        return navigationController.viewControllers.first
    }

    public var hasRootController: Bool {
        return rootViewController != nil
    }

    public var isModalPresent: Bool

    public init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
        self.completions = [:]
        self.isModalPresent = false
        super.init()
    }

    open func present(_ module: Presentable, animated: Bool = true) {
        navigationController.present(module.toPresentable(), animated: animated, completion: nil)
    }

    open func dismissModule(animated: Bool = true, completion: (() -> Void)? = nil) {
        navigationController.dismiss(animated: animated, completion: completion)
    }

    open func push(_ module: Presentable, animated: Bool = true, completion: (() -> Void)? = nil) {

        let controller = module.toPresentable()

        guard controller is UINavigationController == false else {
            return
        }

        if let completion = completion {
            completions[controller] = completion
        }

        navigationController.pushViewController(controller, animated: animated)
    }

    open func popModule(animated: Bool = true)  {
        if let controller = navigationController.popViewController(animated: animated) {
            runCompletion(for: controller)
        }
    }

    open func setRootModule(_ module: Presentable, hideBar: Bool = false) {
        completions.forEach { $0.value() }
        navigationController.setViewControllers([module.toPresentable()], animated: false)
        navigationController.isNavigationBarHidden = hideBar
    }

    open func popToRootModule(animated: Bool) {
        if let controllers = navigationController.popToRootViewController(animated: animated) {
            controllers.forEach { runCompletion(for: $0) }
        }
    }

    private func runCompletion(for controller: UIViewController) {
        guard let completion = completions[controller] else { return }
        completion()
        completions.removeValue(forKey: controller)
    }

    // MARK: Presentable

    public func toPresentable() -> UIViewController {
        return navigationController
    }
}
