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
