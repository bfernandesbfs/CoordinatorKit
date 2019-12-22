import Foundation

public class StackController {

    private var root: Presentable

    public private(set) var children: [Presentable]

    init(root: Presentable) {
        self.root = root
        self.children = []
    }

    public func push(_ element: Presentable) {
        if element is AnyCoordinator {
            children.append(element)
            root.registerParent(element)
        }
    }

    public func pop(_ element: Presentable) {
        children.removeAll { $0 === element }

    }

    public func popIfNeed() {
        children.removeAll {
            $0.canBeRemovedAsChild()
        }
    }

    public func peek() -> Presentable? {
        return children.last
    }
}
