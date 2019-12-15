import UIKit

public typealias NavigationTransition = Transition<UINavigationController>

extension Transition where RootViewController: UINavigationController {

    public static func push(_ presentable: Presentable, animated: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            
            rootViewController.push(presentable.viewController, animated: animated) {
                completion?(false)
            }
        }
    }

    public static func set(_ presentables: [Presentable], animated: Bool = true) -> Transition {
        return Transition(presentables: presentables) { rootViewController, coordinator, completion in

            let controllers = presentables.compactMap({ presentable -> UIViewController? in
                guard let controller = presentable.viewController else {
                    return nil
                }
                controller.nextResponder = coordinator
                return controller
            })

            rootViewController.set(controllers, animated: animated) {
                completion?(false)
            }
        }
    }

    public static func pop(toRoot: Bool = false, animated: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, _, completion in
            rootViewController.pop(toRoot: toRoot, animated: animated) {
                completion?(true)
            }
        }
    }

    public static func popToController(_ presentable: Presentable, animated: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, _, completion in
            rootViewController.pop(to: presentable.viewController, animated: animated) {
                completion?(true)
            }
        }
    }
}
