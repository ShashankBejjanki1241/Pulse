//
//  DIContainer.swift
//  Pulse
//
//  Created by ExtMac on 9/12/25.
//

import Foundation

/// Dependency Injection Container for managing app dependencies
final class DIContainer {
    static let shared = DIContainer()
    
    private var dependencies: [String: Any] = [:]
    
    private init() {}
    
    /// Register a dependency
    func register<T>(_ type: T.Type, factory: @escaping () -> T) {
        let key = String(describing: type)
        dependencies[key] = factory
    }
    
    /// Resolve a dependency
    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        guard let factory = dependencies[key] as? () -> T else {
            fatalError("Dependency \(type) not registered")
        }
        return factory()
    }
    
    /// Check if a dependency is registered
    func isRegistered<T>(_ type: T.Type) -> Bool {
        let key = String(describing: type)
        return dependencies[key] != nil
    }
}
