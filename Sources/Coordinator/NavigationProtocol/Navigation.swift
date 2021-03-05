//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 05.03.2021.
//

import Foundation
import UIKit

struct Navigation: NavigationProtocol {
    
    private weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    var host: UIViewController? { navigationController }
    
    func goForward(viewController: UIViewController, animated: Bool) {
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    func goBackward(viewController: UIViewController, animated: Bool) {
        navigationController?.popToViewController(viewController, animated: animated)
    }
}

extension UINavigationController: NavigationProvider {
    
    public var navigator: NavigationProtocol {
        Navigation(navigationController: self)
    }
}
