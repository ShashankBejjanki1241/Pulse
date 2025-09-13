//
//  OutboxRepository.swift
//  Pulse
//
//  Created by ExtMac on 9/12/25.
//

import Foundation
import CoreData

protocol OutboxRepository {
    func fetchPendingItems() -> [Outbox]
    func insert(item: Outbox)
    func delete(itemId: UUID)
    func incrementRetryCount(for itemId: UUID)
}

final class OutboxRepositoryImpl: OutboxRepository {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.context = context
    }

    func fetchPendingItems() -> [Outbox] {
        let request: NSFetchRequest<Outbox> = Outbox.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Outbox.createdAt, ascending: true)]
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching outbox items: \(error)")
            return []
        }
    }

    func insert(item: Outbox) {
        context.insert(item)
        
        do {
            try context.save()
        } catch {
            print("Error saving outbox item: \(error)")
        }
    }

    func delete(itemId: UUID) {
        let request: NSFetchRequest<Outbox> = Outbox.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", itemId as CVarArg)
        
        do {
            let items = try context.fetch(request)
            if let item = items.first {
                context.delete(item)
                try context.save()
            }
        } catch {
            print("Error deleting outbox item: \(error)")
        }
    }

    func incrementRetryCount(for itemId: UUID) {
        let request: NSFetchRequest<Outbox> = Outbox.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", itemId as CVarArg)
        
        do {
            let items = try context.fetch(request)
            if let item = items.first {
                item.retryCount += 1
                try context.save()
            }
        } catch {
            print("Error incrementing retry count: \(error)")
        }
    }
}
