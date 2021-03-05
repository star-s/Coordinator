//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 05.03.2021.
//

import Foundation
import UIKit

struct PageNavigation: NavigationProtocol {

    private weak var pageViewController: UIPageViewController?
    
    init(pageViewController: UIPageViewController) {
        self.pageViewController = pageViewController
    }
    
    var host: UIViewController? { pageViewController }
    
    func goForward(viewController: UIViewController, animated: Bool) {
        pageViewController?.setViewControllers([viewController], direction: .forward, animated: animated, completion: nil)
    }
    
    func goBackward(viewController: UIViewController, animated: Bool) {
        pageViewController?.setViewControllers([viewController], direction: .reverse, animated: animated, completion: nil)
    }
}

extension UIPageViewController: NavigationProvider {
    
    public var navigator: NavigationProtocol {
        PageNavigation(pageViewController: self)
    }
}
