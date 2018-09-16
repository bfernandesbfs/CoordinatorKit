//
//  RouterType.swift
//  CoordinatorKit-iOS
//
//  Created by Bruno Fernandes on 9/15/18.
//  Copyright © 2018 bfernandesbfs. All rights reserved.
//

import UIKit

public protocol RouterType: class, Presentable {

    var navigationController: UINavigationController { get }
    
    var rootViewController: UIViewController? { get }

    var isModal: Bool { get set }

    func present(_ module: Presentable, animated: Bool)

    func dismissModule(animated: Bool, completion: (() -> Void)?)

    func push(_ module: Presentable, animated: Bool, completion: (() -> Void)?)

    func popModule(animated: Bool)

    func setRootModule(_ module: Presentable, hideBar: Bool)

    func popToRootModule(animated: Bool)
}
