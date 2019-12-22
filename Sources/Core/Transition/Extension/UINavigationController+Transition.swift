import UIKit

extension UINavigationController {

    func push(_ viewController: UIViewController, animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            pushViewController(viewController, animated: animated)
        }, completion: completion)
    }

    func set(_ viewControllers: [UIViewController], animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            setViewControllers(viewControllers, animated: animated)
        }, completion: completion)
    }

    func pop(toRoot: Bool, animated: Bool, completion: PerformHandler?) -> [UIViewController]? {

        var controllers: [UIViewController]? = []

        beginTransition(invoking: {

            if toRoot {
                controllers = popToRootViewController(animated: animated)
            } else if let controller = popViewController(animated: animated) {
                controllers = [controller]
            }

        }, completion: completion)

        return controllers
    }

    func pop(to viewController: UIViewController, animated: Bool, completion: PerformHandler?) -> [UIViewController]? {

        var controllers: [UIViewController]? = []

        beginTransition(invoking: {
            controllers = popToViewController(viewController, animated: animated)
        }, completion: completion)

        return controllers
    }
}
