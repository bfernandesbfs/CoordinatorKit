import Foundation

internal final class StackController {
    
    internal var count: Int {
        return children.count
    }
    
    private(set) internal var children: [Presentable]
    
    private var root: Presentable
    
    internal init(root: Presentable) {
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
            
            if let elements = elements, (elements.contains { $0 === child.viewController }) {
                
                if root is SharedRootProtocol {
                    root.nextResponder?._stack.pop(elements)
                }
                
                return true
            }
            
            return child.canBeRemovedAsChild()
        }
    }
    
    internal func peek() -> Presentable? {
        return children.last
    }
    
#if DEBUG
    internal func printTree() {
        
        var root: AnyCoordinator?
        var initial: AnyCoordinator = self.root as! AnyCoordinator
        
        while root == nil {
            
            if initial.nextResponder == nil {
                root = initial
                break
            }
            
            initial = initial.nextResponder!
        }
        
        func test(root: AnyCoordinator, space: String) {
            
            var space = space
            
            print("\(space) |_ \(root)")
            
            space += String(repeating: " ", count: 4)
            for child in root._stack.children as! [AnyCoordinator] {
                
                if !child._stack.children.isEmpty {
                    test(root: child, space: space)
                } else {
                    print("\(space) |____ \(child)")
                }
            }
        }
        
        print("\n BEGIN ------------------------------------------\n")
        
        test(root: root!, space: String())
        
        print("\n END --------------------------------------------\n")
    }
#endif
}
