//
//  ListViewModel.swift
//  ToDo
//
//  Created by Aleksandr Lipatov on 11.09.2022.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var myNote: [Notes] = [] {
        
        // Any time myNote is changed, the code below runs
        
        didSet {
            saveNotes()
        }
    }
    let noteKey: String = "notes_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        
        guard
            let data = UserDefaults.standard.data(forKey: noteKey),
            let savedNotes = try? JSONDecoder().decode([Notes].self, from: data)
        else { return }
        
        self.myNote = savedNotes
        
//        let newItems = [
//            Notes(title: "Note 1", noteText: ""),
//            Notes(title: "Note 2", noteText: "")
//        ]
//        myNote.append(contentsOf: newItems)
    }
    
    func deleteNote(indexSet: IndexSet) {
        myNote.remove(atOffsets: indexSet)
    }

    func moveNote(from: IndexSet, to: Int) {
        myNote.move(fromOffsets: from, toOffset: to)
    }
    
    func addNote() {
        let newNote = Notes(title: "Your Note", noteText: "")
        myNote.append(newNote)
    }
    
    func updateNotes(item: Notes) {
        if let index = myNote.firstIndex(where: { $0.id == item.id}) {
            myNote[index] = item.updateNote()
        }
    }
    
    func saveNotes() {
        if let encodedData = try? JSONEncoder().encode(myNote) {
            UserDefaults.standard.set(encodedData, forKey: noteKey)
        }
    }
    
}


