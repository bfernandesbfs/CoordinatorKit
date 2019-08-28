//
//  BaseCoordinator.swift
//  CoordinatorKit-iOS
//
//  Created by gabriel.n.reynoso on 28/08/19.
//  Copyright © 2019 bfernandesbfs. All rights reserved.
//

import UIKit

open class BaseCoordinator: CoordinatorRouter, Responder {
    
    public var rootViewController: UIViewController?
    public var router: RouterType?
    
    internal var storedChildren: [BaseCoordinator]
    internal var storedParent: BaseCoordinator?
    
    public var nextResponder: Responder?
    
    public init() {
        rootViewController = nil
        router = nil
        storedChildren = []
        storedParent = nil
        nextResponder = nil
    }
    
    internal func add(parent: BaseCoordinator) {
        storedParent = parent
    }
    
    internal func remove(childAt index: Int) {
        storedChildren.remove(at: index)
    }
    
    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        if rootViewController != nil {
            if let router = parent?.router, router.isModalPresent {
                parent?.router?.isModalPresent = false
                parent?.router?.dismissModule(animated: animated, completion: completion)
            }
            else {
                parent?.router?.popModule(animated: animated)
                
                if let completion = completion {
                    completion()
                }
            }
        } else if let completion = completion {
            completion()
        }
    }
}
