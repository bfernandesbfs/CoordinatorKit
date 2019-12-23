import UIKit

public typealias ViewTransition = Transition<UIViewController>

extension Transition {

    public static func show(_ presentable: Presentable, animation: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.show(presentable.viewController, animated: animation) {
                completion?(.show)
            }
        }
    }

    public static func showDetail(_ presentable: Presentable, animation: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.showDetail(presentable.viewController, animated: animation) {
                completion?(.show)
            }
        }
    }

    public static func present(onRoot: Bool = false, _ presentable: Presentable, animation: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.present(onRoot: onRoot, presentable.viewController, animated: animation) {
                completion?(.show)
            }
        }
    }

    public static func dismiss(toRoot: Bool = false, animation: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, coordinator, completion in
            rootViewController.dismiss(toRoot: toRoot, animated: animation) {
                completion?(.dismiss(nil))
            }
        }
    }

    public static func back(animation: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, coordinator, completion in
            rootViewController.back(animated: animation) {
                completion?(.dismiss(nil))
            }
        }
    }
}

