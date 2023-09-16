import UIKit

private struct CoordiantorKeys {
    static var stackKey: UInt8 = 1
    static var responderKey: UInt8 = 2
    static var responderControllerKey: UInt8 = 3
}

public protocol AnyCoordinator: Presentable, Responder {}

extension AnyCoordinator {

    internal var _stack: StackController {
        get { return AssociatedObject.get(base: self, key: &CoordiantorKeys.stackKey) { return StackController(root: self) } }
        set { AssociatedObject.set(base: self, key: &CoordiantorKeys.stackKey, value: newValue) }
    }
    
}

extension AnyCoordinator {
    
    public var childrenCount: Int {
        return _stack.count
    }
    
}

extension Presentable {

    public var nextResponder: AnyCoordinator? {
        get { return AssociatedObject.get(base: self, key: &CoordiantorKeys.responderKey) }
        set { AssociatedObject.set(base: self, key: &CoordiantorKeys.responderKey, value: newValue) }
    }
}
