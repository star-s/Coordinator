//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 17/10/2020.
//

import Foundation
import UIKit

extension UIResponder {
    
    public func getTarget<T>(_ type: T.Type) -> T? {
        if let result = self as? T {
            return result
        }
        return next?.getTarget(type)
    }
}
