//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 05.03.2021.
//

import Foundation
import UIKit

struct WindowNavigation: NavigationProtocol {
    
    private weak var window: UIWindow?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    var host: UIViewController? { window?.rootViewController }
    
    func goForward(viewController: UIViewController, animated: Bool) {
        window?.rootViewController = viewController
    }
    
    func goBackward(viewController: UIViewController, animated: Bool) {
        window?.rootViewController = viewController
    }
}

extension UIWindow: NavigationProvider {
    
    public var navigator: NavigationProtocol {
        if let provider = rootViewController as? NavigationProvider {
            return provider.navigator
        }
        return WindowNavigation(window: self)
    }
}
