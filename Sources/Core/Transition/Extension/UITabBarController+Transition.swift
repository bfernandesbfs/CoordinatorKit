import UIKit

extension UITabBarController {

    internal func set(_ viewControllers: [UIViewController], animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            setViewControllers(viewControllers, animated: animated)
        }, completion: completion)
    }

}
