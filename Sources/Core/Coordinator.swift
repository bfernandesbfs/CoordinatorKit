import UIKit

public typealias PerformHandler = () -> Void

public protocol Coordinator: AnyCoordinator {

    associatedtype RootViewController: UIViewController

    var rootViewController: RootViewController { get }

    func router<Transition: TransitionProtocol>(_ transition: Transition, completion: PerformHandler?) where Transition.RootViewController == RootViewController

}

extension Coordinator {

    public var viewController: UIViewController! {
        return rootViewController
    }

    public func router<Transition: TransitionProtocol>(_ transition: Transition, completion: PerformHandler? = nil) where Transition.RootViewController == RootViewController {

        transition.perform(on: rootViewController, with: self) { finished in

            if finished {
                self.removeChildrenIfNeeded()
            } else {
                transition.presentables.forEach(self._stack.push)
            }
            completion?()
        }

    }

    public func registerParent(_ presentable: Presentable) {
        presentable.nextResponder = self
        presentable.viewController.nextResponder = (presentable as? AnyCoordinator)
    }

    public func removeChildrenIfNeeded() {
        self.nextResponder?._stack.pop(self)
    }
}

