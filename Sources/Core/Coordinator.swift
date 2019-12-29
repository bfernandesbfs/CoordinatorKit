import UIKit

public typealias PerformHandler = () -> Void

public protocol Coordinator: AnyCoordinator {

    associatedtype RootViewController: UIViewController

    var rootViewController: RootViewController { get }

    func router<Transition>(_ transition: Transition, callback completion: PerformHandler?) where Transition: TransitionProtocol, Transition.RootViewController == RootViewController

    func router<Transition>(_ transition: Transition, target coordinator: AnyCoordinator, callback completion: PerformHandler?) where Transition: TransitionProtocol, Transition.RootViewController == RootViewController

    func sendToNext<EventType: Event>(event: EventType)
}

extension Coordinator {

    // MARK: Public Property

    public var viewController: UIViewController! {
        return rootViewController
    }

    // MARK: Public Methods

    public func router<Transition>(_ transition: Transition, callback completion: PerformHandler? = nil)
        where Transition: TransitionProtocol, Transition.RootViewController == RootViewController {
        router(transition, target: self, callback: completion)
    }

    public func router<Transition>(_ transition: Transition, target coordinator: AnyCoordinator, callback completion: PerformHandler? = nil) where Transition: TransitionProtocol, Transition.RootViewController == RootViewController {

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

    // MARK: Private Methods

    private func removeChildrenIfNeeded(_ presentables: [Presentable]?) {
        nextResponder?._stack.pop(presentables)

        #if DEBUG
        _stack.printTree()
        #endif
    }
}
