//
//  ContentView.swift
//  ToDo
//
//  Created by Aleksandr Lipatov on 09.09.2022.
//

import SwiftUI



struct ContentView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State private var searchString: String = ""
    
    var body: some View {
        
        List {
            TextField("Search", text: $searchString)
            Section {
                ForEach(listViewModel.allMyNotes) { index in
                    NavigationLink(index.noteText) {
                        NoteView(noteItem: index)
                    }
                }
                .onDelete(perform: listViewModel.deleteNote)
                .onMove(perform: listViewModel.moveNote)
            }
        }
        .navigationTitle("To Do List")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                Button(action: listViewModel.addNote, label: {
                    Text("Add")
                })
            }
            ToolbarItemGroup(placement: .navigationBarLeading) {
                EditButton()
            }
            
        }
    }
}
    
    //    func deleteNote(at offsets: IndexSet) {
    //        guard let index = Array(offsets).first else { return }
    //        myNote.remove(at: index)
    
//}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
        .environmentObject(ListViewModel())
    }
}
