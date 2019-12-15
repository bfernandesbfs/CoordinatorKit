import UIKit

public typealias PresentationHandler = (_ finished: Bool) -> Void

public protocol TransitionProtocol {

    associatedtype RootViewController: UIViewController

    var presentables: [Presentable] { get }

    func perform(on rootViewController: RootViewController, with coordinator: AnyCoordinator, completion: PresentationHandler?)
}

public struct Transition<RootViewController: UIViewController>: TransitionProtocol {

    public typealias PerformClosure = (
        _ rootViewController: RootViewController,
        _ coordinator: AnyCoordinator,
        _ completion: PresentationHandler?) -> Void

    private var _presentables: [Presentable]
    private var _perform: PerformClosure

    public var presentables: [Presentable] {
        return _presentables
    }

    public init(presentables: [Presentable], perform: @escaping PerformClosure) {
        self._presentables = presentables
        self._perform = perform
    }

    public func perform(on rootViewController: RootViewController, with coordinator: AnyCoordinator, completion: PresentationHandler?) {
        autoreleasepool {
            _perform(rootViewController, coordinator, completion)
        }
    }

}

public typealias NavigationTransition = Transition<UINavigationController>

extension Transition where RootViewController: UINavigationController {

    public static func push(_ presentable: Presentable, animation: Bool = true) -> Transition {
        return Transition(presentables: [presentable]) { rootViewController, coordinator, completion in
            presentable.viewController.nextResponder = coordinator
            rootViewController.pushViewController(presentable.viewController, animated: animation)
            completion?(false)
        }
    }

    public static func pop(animation: Bool = true) -> Transition {
        return Transition(presentables: []) { rootViewController, _, completion in
            rootViewController.popViewController(animated: animation)
            completion?(true)
        }
    }
}


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
