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
    //var title = "Notie"
    
    enum FocusField: Hashable {
        case field
    }
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        
        Form {
            Section(noteItem.noteText.isEmpty ? noteItem.title : noteItem.noteText) {
                TextEditor(text: $noteItem.noteText)
                    .focused($focusedField, equals: .field)
                    .task {
                        self.focusedField = .field
                    }
            }
        }
        
        .onChange(of: noteItem.noteText) { item in
            listViewModel.updateNotes(item: noteItem)
        }
    }
}


struct NoteView_Previews: PreviewProvider {
    static var noteItem1 = Note(title: "Text", noteText: "")
    static var previews: some View {
        NavigationView {
            NoteView(noteItem: noteItem1)
        }
        .environmentObject(ListViewModel())
    }
}
