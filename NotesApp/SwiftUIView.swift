//
//  SwiftUIView.swift
//  NotesApp


import SwiftUI


struct AddNoteView: View {
    @ObservedObject var vm: NotesViewModel
    @Environment(\.dismiss) var dismiss

    @State private var title = ""
    @State private var content = ""

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextEditor(text: $content)
            }
            .navigationTitle("New Note")
            .toolbar {
                Button("Save") {
                    vm.addNote(title: title, content: content)
                    dismiss()
                }
            }
        }
    }
}
#Preview {
    AddNoteView(vm: NotesViewModel())
}
