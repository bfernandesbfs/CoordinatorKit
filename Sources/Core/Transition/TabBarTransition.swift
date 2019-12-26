import UIKit

public typealias TabBarTransition = Transition<UITabBarController>

extension Transition where RootViewController: UITabBarController {

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
                completion?(nil)
            }
        }
    }
}
