import UIKit

extension UINavigationController {

    func push(_ viewController: UIViewController, animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            pushViewController(viewController, animated: animated)
        }, completion: completion)
    }

    func pop(toRoot: Bool, animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {

            if toRoot {
                popToRootViewController(animated: animated)
            } else {
                popViewController(animated: animated)
            }

        }, completion: completion)

    }

    func set(_ viewControllers: [UIViewController], animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            setViewControllers(viewControllers, animated: animated)
        }, completion: completion)
    }

    func pop(to viewController: UIViewController, animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            _ = popToViewController(viewController, animated: animated)
        }, completion: completion)
    }
}
