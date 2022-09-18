//
//  NoteView.swift
//  ToDo
//
//  Created by Aleksandr Lipatov on 09.09.2022.
//

import SwiftUI

struct NoteView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State var noteItem: Note
    
    
    var body: some View {
        
        Form {
            Section {
                TextField("Note", text: $noteItem.noteText)
                    .padding()
                    .clipped()
                    
            } header: {
                if (noteItem.noteText.count >= 1) {
                    Text(noteItem.noteText)
                }
                else {
                    Text(noteItem.title)
                }
            }
        }
        .onChange(of: noteItem.noteText) { item in
            listViewModel.updateNotes(item: noteItem)
        }
    }
}
    

struct NoteView_Previews: PreviewProvider {
    static var noteItem1 = Note(title: "Text", noteText: "Text")
    static var previews: some View {
        NavigationView {
            NoteView(noteItem: noteItem1)
        }
        .environmentObject(ListViewModel())
    }
}
