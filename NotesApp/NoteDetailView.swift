//
//  NoteDetailView.swift
//  NotesApp
//
//  Created by Apple Orchard on 28/12/2025.
//

import SwiftUI

struct NoteDetailView: View {
    let note: Note

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(note.title ?? "").font(.title)
            Text(note.content ?? "")
            Spacer()
        }
        .padding()
    }
}


#Preview {
    NoteDetailView()
}
