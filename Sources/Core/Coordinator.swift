import UIKit

public typealias PerformHandler = () -> Void

public protocol Coordinator: AnyCoordinator {

    associatedtype RootViewController: UIViewController

    var rootViewController: RootViewController { get }

    func router<Transition: TransitionProtocol>(_ transition: Transition, completion: PerformHandler?) where Transition.RootViewController == RootViewController

    func registerShared(_ coordinator: AnyCoordinator)

    func sendToNext<EventType: Event>(event: EventType)
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
            case .dismiss(let presentables):
                self.removeChildrenIfNeeded(presentables)
            }

            completion?()
        }

    }

    public func registerShared(_ coordinator: AnyCoordinator) {
        _stack.push(coordinator)
    }

    public func registerParent(_ presentable: Presentable) {
        presentable.nextResponder = self
        presentable.viewController.nextResponder = (presentable as? AnyCoordinator)
    }

    public func sendToNext<EventType: Event>(event: EventType) {
        nextResponder?.tryToHandle(event)
    }

    private func removeChildrenIfNeeded(_ presentables: [Presentable]?) {
        nextResponder?._stack.pop(presentables)
    }
}
