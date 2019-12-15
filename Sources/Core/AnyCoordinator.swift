import Foundation

private struct CoordiantorKeys {
    static var stackKey: UInt8 = 1
    static var responderKey: UInt8 = 2
}

public protocol AnyCoordinator: Presentable, Responder {}

extension AnyCoordinator {

    internal var _stack: StackController {
        get { return AssociatedObject.get(base: self, key: &CoordiantorKeys.stackKey) { return StackController(root: self) } }
        set { AssociatedObject.set(base: self, key: &CoordiantorKeys.stackKey, value: newValue) }
    }
}

extension Presentable {

    public var nextResponder: AnyCoordinator? {
        get { return AssociatedObject.get(base: self, key: &CoordiantorKeys.responderKey) }
        set { AssociatedObject.set(base: self, key: &CoordiantorKeys.responderKey, value: newValue) }
    }
}
