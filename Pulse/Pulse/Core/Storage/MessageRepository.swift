//
//  MessageRepository.swift
//  Pulse
//
//  Created by ExtMac on 9/12/25.
//

import Foundation
import CoreData

protocol MessageRepository {
    func fetchMessages(for channelId: String) -> [Message]
    func insert(message: Message)
    func updateStatus(for localId: String, to status: String)
}

final class MessageRepositoryImpl: MessageRepository {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.context = context
    }

    func fetchMessages(for channelId: String) -> [Message] {
        let request: NSFetchRequest<Message> = Message.fetchRequest()
        request.predicate = NSPredicate(format: "channelId == %@", channelId)
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Message.createdAt, ascending: true)]
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching messages: \(error)")
            return []
        }
    }

    func insert(message: Message) {
        context.insert(message)
        
        do {
            try context.save()
        } catch {
            print("Error saving message: \(error)")
        }
    }

    func updateStatus(for localId: String, to status: String) {
        let request: NSFetchRequest<Message> = Message.fetchRequest()
        request.predicate = NSPredicate(format: "localId == %@", localId)
        
        do {
            let messages = try context.fetch(request)
            if let message = messages.first {
                message.status = status
                try context.save()
            }
        } catch {
            print("Error updating message status: \(error)")
        }
    }
}
