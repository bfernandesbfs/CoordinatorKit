import UIKit

public protocol Coordinator: AnyCoordinator {

    associatedtype RootViewController: UIViewController

    var rootViewController: RootViewController { get }

    func router<Transition: TransitionProtocol>(_ transition: Transition, completion: PresentationHandler?) where Transition.RootViewController == RootViewController

}

extension Coordinator {

    public var viewController: UIViewController! {
        return rootViewController
    }

    public func router<Transition: TransitionProtocol>(_ transition: Transition, completion: PresentationHandler? = nil) where Transition.RootViewController == RootViewController {

        transition.perform(on: rootViewController) {

            transition.presentables.forEach(self._stack.push)

            completion?()
        }

    }

    public func registerParent(_ presentable: Presentable) {
        var presentable = presentable
        presentable.nextResponder = self
    }
}
