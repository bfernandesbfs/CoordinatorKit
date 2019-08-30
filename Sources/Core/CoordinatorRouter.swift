//
//  CoordinatorRouter.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public protocol CoordinatorRouter: Presentable {

    var rootViewController: UIViewController? { get }

    var router: RouterType? { get set }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?)
}
