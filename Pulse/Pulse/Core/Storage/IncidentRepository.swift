//
//  IncidentRepository.swift
//  Pulse
//
//  Created by ExtMac on 9/12/25.
//

import Foundation
import CoreData

protocol IncidentRepository {
    func fetchIncidents() -> [Incident]
    func insert(incident: Incident)
    func update(incident: Incident)
    func delete(incidentId: String)
}

final class IncidentRepositoryImpl: IncidentRepository {
    private let context: NSManagedObjectContext

    init(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.context = context
    }

    func fetchIncidents() -> [Incident] {
        let request: NSFetchRequest<Incident> = Incident.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Incident.updatedAt, ascending: false)]
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching incidents: \(error)")
            return []
        }
    }

    func insert(incident: Incident) {
        context.insert(incident)
        
        do {
            try context.save()
        } catch {
            print("Error saving incident: \(error)")
        }
    }

    func update(incident: Incident) {
        do {
            try context.save()
        } catch {
            print("Error updating incident: \(error)")
        }
    }

    func delete(incidentId: String) {
        let request: NSFetchRequest<Incident> = Incident.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", incidentId)
        
        do {
            let incidents = try context.fetch(request)
            if let incident = incidents.first {
                context.delete(incident)
                try context.save()
            }
        } catch {
            print("Error deleting incident: \(error)")
        }
    }
}
