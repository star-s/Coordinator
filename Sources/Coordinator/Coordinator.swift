//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 17/10/2020.
//

import Foundation
import UIKit

open class Coordinator: UIResponder {
    //
    public let navigation: NavigationProtocol
    
    public init(navigation: NavigationProtocol) {
        self.navigation = navigation
    }
    
    public private(set) weak var parent: Coordinator?
    
    private var childCoordinators: [Coordinator] = []

    open func addChild(coordinator: Coordinator) {
        childCoordinators.append(coordinator)
        coordinator.parent = self
    }
    
    open func removeChild(coordinator: Coordinator) {
        guard let index = childCoordinators.lastIndex(of: coordinator) else {
            return
        }
        childCoordinators.remove(at: index).parent = nil
    }
    
    open func start() {
        fatalError("Method \(#function) is abstract - must be overrided!")
    }
    
    open override var next: UIResponder? {
        parent
    }
}

public extension Coordinator {
    
    var lastOnChain: Coordinator {
        if let lastChild = childCoordinators.last {
            return lastChild.lastOnChain
        }
        return self
    }
    
    var bundle: Bundle {
        Bundle(for: Self.self)
    }
}
