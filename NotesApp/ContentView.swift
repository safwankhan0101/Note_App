//
//  ContentView.swift
//  NotesApp
//
//  Created by Apple Orchard on 28/12/2025.
//

import SwiftUI
import CoreData
struct ContentView: View {
    @StateObject private var vm = NotesViewModel()
    @State private var showAdd = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.notes, id: \.id) { note in
                    NavigationLink(note.title ?? "") {
                        NoteDetailView(note: note)
                    }
                }
                .onDelete { indexSet in
                    indexSet.map { vm.notes[$0] }.forEach(vm.deleteNote)
                }
            }
            .navigationTitle("My Notes")
            .toolbar {
                Button("+") { showAdd = true }
            }
            .sheet(isPresented: $showAdd) {
                AddNoteView(vm: vm)
            }
        }
    }
}


#Preview {
    ContentView()
}
