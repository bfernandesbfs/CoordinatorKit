import Foundation

internal final class StackController {

    private var root: Presentable

    public private(set) var children: [Presentable]

    init(root: Presentable) {
        self.root = root
        self.children = []
    }

    internal func push(_ element: Presentable) {
        if element is AnyCoordinator {
            children.append(element)
            root.registerParent(element)
        }
    }

    internal func pop(_ elements: [Presentable]?) {

        children.removeAll { child in

            if child is SharedCoordinator, let elements = elements, (elements.contains { $0 === child.viewController }) {

                if root is SharedCoordinator {
                    root.nextResponder?._stack.pop(elements)
                }
                
                return true
            }

            return child.canBeRemovedAsChild()
        }

        print(" - \(root)")
        print(" |---- \(children.compactMap { "\($0)" }.joined(separator: "\n"))\n")
    }

    internal func peek() -> Presentable? {
        return children.last
    }

}
