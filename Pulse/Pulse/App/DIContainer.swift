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

    let messageRepo: MessageRepository
    let incidentRepo: IncidentRepository
    let outboxRepo: OutboxRepository

    private init() {
        let ctx = CoreDataStack.shared.mainContext
        self.messageRepo = MessageRepositoryImpl(context: ctx)
        self.incidentRepo = IncidentRepositoryImpl(context: ctx)
        self.outboxRepo = OutboxRepositoryImpl(context: ctx)
    }
}
