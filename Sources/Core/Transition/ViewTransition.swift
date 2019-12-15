import UIKit

public typealias ViewTransition = Transition<UIViewController>

extension Transition {

    public static func present(_ presentable: Presentable, animation: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.topPresentedViewController.present(presentable.viewController, animated: animation) {
                completion?(false)
            }
        }
    }

    public static func dismiss(root: Bool = false, animation: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, coordinator, completion in
            let dismissalViewController = root ? rootViewController : rootViewController.topPresentedViewController
            dismissalViewController.dismiss(animated: animation) {
                completion?(true)
            }
        }
    }
}
