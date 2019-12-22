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

        transition.perform(on: rootViewController, with: self) { type in

            switch type {
            case .show:
                transition.presentables.forEach(self._stack.push)
            case .dismiss:
                self.removeChildren(isSameRoot: false)
            case .parent:
                self.removeChildren(isSameRoot: true)
            }

            completion?()
        }

    }

    public func registerChildren(_ coordinator: AnyCoordinator) {
        self._stack.push(coordinator)
    }

    public func registerParent(_ presentable: Presentable) {
        presentable.nextResponder = self
        presentable.viewController.nextResponder = (presentable as? AnyCoordinator)
    }

    private func removeChildren(isSameRoot: Bool) {
        if isSameRoot {
            self.nextResponder?._stack.pop(self)
        } else {
            self.nextResponder?._stack.popIfNeed()
        }
    }
}

public protocol ChildCoordinator: Presentable {

    var childViewController: UIViewController { get }
    
}
