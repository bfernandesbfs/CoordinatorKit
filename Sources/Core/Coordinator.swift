import UIKit

public typealias PerformHandler = () -> Void

public protocol Coordinator: AnyCoordinator {

    associatedtype RootViewController: UIViewController

    var rootViewController: RootViewController { get }

    func router<Transition: TransitionProtocol>(_ transition: Transition, callback completion: PerformHandler?) where Transition.RootViewController == RootViewController

    func router<Transition: TransitionProtocol>(_ transition: Transition, target coordinator: AnyCoordinator, callback completion: PerformHandler?) where Transition.RootViewController == RootViewController

    func sendToNext<EventType: Event>(event: EventType)
}

extension Coordinator {

    public var viewController: UIViewController! {
        return rootViewController
    }

    public func router<Transition: TransitionProtocol>(_ transition: Transition, callback completion: PerformHandler? = nil) where Transition.RootViewController == RootViewController {
        router(transition, target: self, callback: completion)
    }

    public func router<Transition: TransitionProtocol>(_ transition: Transition, target coordinator: AnyCoordinator, callback completion: PerformHandler? = nil) where Transition.RootViewController == RootViewController {

        transition.presentables.forEach(self._stack.push)
        transition.perform(on: rootViewController, with: coordinator) { presentables in
            completion?()
            self.removeChildrenIfNeeded(presentables)
        }

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

        #if DEBUG
        _stack.printTree()
        #endif
    }
}
