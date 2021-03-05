//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 17/10/2020.
//

import Foundation
import UIKit

public protocol NavigationProvider {
    var navigator: NavigationProtocol { get }
}

public protocol NavigationProtocol {

    var host: UIViewController? { get }
    
    func show(viewController: UIViewController, animated: Bool)
    func showModally(viewController: UIViewController, animated: Bool)
    
    func goForward(viewController: UIViewController, animated: Bool)
    func goBackward(viewController: UIViewController, animated: Bool)
}

public extension NavigationProtocol {
    
    func show(viewController: UIViewController, animated: Bool) {
        goForward(viewController: viewController, animated: animated)
    }
    
    func showModally(viewController: UIViewController, animated: Bool) {
        host?.present(viewController, animated: animated, completion: nil)
    }
}
