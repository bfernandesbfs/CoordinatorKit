import UIKit

extension UIViewController {

    internal func beginTransition(invoking: () -> Void, completion: PerformHandler?) {

        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)

        autoreleasepool {
            invoking()
        }

        CATransaction.commit()

    }

    func show(_ viewController: UIViewController, animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            show(viewController, sender: nil)
        }, completion: completion)
    }

    func showDetail(_ viewController: UIViewController, animated: Bool, completion: PerformHandler?) {

        beginTransition(invoking: {
            showDetailViewController(viewController, sender: nil)
        }, completion: completion)
    }

    func present(onRoot: Bool, _ viewController: UIViewController, animated: Bool, completion: PerformHandler?) {

        let presentingViewController = onRoot ? self : topPresentedViewController
        presentingViewController.present(viewController, animated: animated, completion: completion)
    }

    func dismiss(toRoot: Bool, animated: Bool, completion: PerformHandler?) {
        
        let presentedViewController = topPresentedViewController
        let dismissalViewController = toRoot ? self : presentedViewController
        dismissalViewController.dismiss(animated: animated, completion: completion)
    }
}
