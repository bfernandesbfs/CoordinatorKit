import UIKit

public typealias ViewTransition = Transition<UIViewController>

extension Transition {

    public static func show(_ presentable: Presentable, animated: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.show(presentable.viewController, animated: animated) {
                completion?(nil)
            }
        }
    }

    public static func showDetail(_ presentable: Presentable, animated: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.showDetail(presentable.viewController, animated: animated) {
                completion?(nil)
            }
        }
    }

    public static func present(onRoot: Bool = false, _ presentable: Presentable, animated: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.present(onRoot: onRoot, presentable.viewController, animated: animated) {
                completion?(nil)
            }
        }
    }

    public static func dismiss(toRoot: Bool = false, animated: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, coordinator, completion in
            rootViewController.dismiss(toRoot: toRoot, animated: animated) {
                completion?(nil)
            }
        }
    }

    public static func back(animated: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, coordinator, completion in
            rootViewController.back(animated: animated) {
                completion?(nil)
            }
        }
    }
}
