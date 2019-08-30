//
//  BaseCoordinator+CoordinatorNode.swift
//  CoordinatorKit-iOS
//
//  Created by gabriel.n.reynoso on 28/08/19.
//  Copyright © 2019 bfernandesbfs. All rights reserved.
//

import Foundation

extension BaseCoordinator: CoordinatorNode {
    public typealias SubNode = BaseCoordinator
    
    public var children: [BaseCoordinator] {
        return storedChildren
    }
    
    public var parent: BaseCoordinator? {
        return storedParent
    }
    
    public func add(child: BaseCoordinator) {
        print("Add child \(child) in \(self)")
        
        for element in storedChildren where element === child {
            return
        }
        storedChildren.append(child)
        child.storedParent = self
        child.nextResponder = self
        if child.router == nil {
            child.router = router
        }
    }
    
    public func remove(child: BaseCoordinator) {
        print("Remove child \(self) in \(child)")
        
        if !child.children.isEmpty {
            for (index, element) in child.children.enumerated() where element === self {
                child.storedChildren.remove(at: index)
                storedParent = nil
                break
            }
        }
    }
}
