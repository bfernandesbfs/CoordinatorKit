import UIKit

public struct Transition<RootViewController: UIViewController>: TransitionProtocol {

    public typealias PerformClosure = (_ rootViewController: RootViewController,
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

    public func perform(on rootViewController: RootViewController, completion: PresentationHandler?) {
        autoreleasepool {
            _perform(rootViewController, completion)
        }
    }

}

public typealias NavigationTransition = Transition<UINavigationController>

extension NavigationTransition {

    public static func push(_ presentable: Presentable, animation: Bool = true) -> Transition<UINavigationController> {
        return Transition(presentables: [presentable]) { rootViewController, completion in
            rootViewController.pushViewController(presentable.viewController, animated: animation)
            completion?()
        }
    }
}


public typealias ViewTransition = Transition<UIViewController>

extension ViewTransition {

    public static func present(_ presentable: Presentable, animation: Bool = true) -> Transition<UIViewController> {
        return Transition(presentables: [presentable]) { rootViewController, completion in
            rootViewController.present(presentable.viewController, animated: false) {
                completion?()
            }
        }
    }
}
