//
//  CoordinatorNode.swift
//  CoordinatorKit-iOS
//
//  Created by gabriel.n.reynoso on 28/08/19.
//  Copyright © 2019 bfernandesbfs. All rights reserved.
//

import Foundation

public protocol CoordinatorNode: class {
    associatedtype SubNode
    
    var children: [SubNode] { get }
    var parent: SubNode? { get }
    
    func add(child: SubNode)
    func remove(child: SubNode)
}
