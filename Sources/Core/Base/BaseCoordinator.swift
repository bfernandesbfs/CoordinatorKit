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
    
    private var hasRootViewController: Bool {
        return rootViewController != nil
    }
    
    private var isModalViewController: Bool {
        return parent?.router?.isModalPresent ?? false
    }
    
    public init() {
        rootViewController = nil
        router = nil
        storedChildren = []
        storedParent = nil
        nextResponder = nil
    }
    
    public func dismissModule(animated: Bool, completion: (() -> Void)?) {
        guard !isModalViewController else {
            dismissModalModule(animated: animated, completion: completion)
            return
        }
        
        defer { completion?() }
        
        popModule(animated: animated)
    }
    
    private func popModule(animated: Bool) {
        if hasRootViewController {
            parent?.router?.popModule(animated: animated)
        }
    }
    
    private func dismissModalModule(animated: Bool, completion: (() -> Void)?) {
        if hasRootViewController {
            parent?.router?.isModalPresent = false
            parent?.router?.dismissModule(animated: animated, completion: completion)
        }
    }
}
