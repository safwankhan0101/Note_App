//
//  PersistenceController.swift
//  NotesApp
//
//  Created by Apple Orchard on 28/12/2025.
//

import Foundation
import CoreData

class NotesViewModel: ObservableObject {

    let context = PersistenceController.shared.container.viewContext
    @Published var notes: [Note] = []

    init() {
        fetchNotes()
    }

    func fetchNotes() {
        let request = Note.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: false)]
        notes = (try? context.fetch(request)) ?? []
    }

    func addNote(title: String, content: String) {
        let note = Note(context: context)
        note.id = UUID()
        note.title = title
        note.content = content
        note.date = Date()
        save()
    }

    func deleteNote(_ note: Note) {
        context.delete(note)
        save()
    }

    private func save() {
        try? context.save()
        fetchNotes()
    }
}
