//
//  ContentView.swift
//  Notes WatchKit Extension
//
//  Created by Egor Molchanov on 03.09.2022.
//

import SwiftUI

struct ContentView: View {
    // Mark: - Property
    
    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    
    
    
    // Mark: - Functions
    
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
        //dump(notes)
        
        do {
            // 1. Convert the notes array to data using JSONEncoder
            
            let data = try JSONEncoder().encode(notes)
            
            // 2. Create a new URL to save the file using the getDocumentDirectory
            
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            // 3. Write the data to the given URL
            
            try data.write(to: url)
            
        } catch {
            print("Saving data has failed")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                // 1. Get the notes URL path
                
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                // 2. Create a new propety for the data
                
                let data = try Data(contentsOf: url)
                // 3. Decode the data
                
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // Do something
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    // Mark: - Body
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6){
                
                TextField("Add new note", text: $text)
                
                
                Button(action: {
                    // 1. Only run the button's action when the text failed is not empty
                    
                    guard text.isEmpty == false else { return }
                    
                    
                    // 2. Create a new note item and initialize it with the text value
                    
                    let note = Note(id: UUID(), text: text)
                    
                    // 3. Add the new note item to the notes array (append)
                    
                    notes.append(note)
                    
                    // 4. make the text failed empty
                    
                    text = ""
                    
                    // 5. save the notes (function)
                    
                    save()
                    
                }) {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 40, weight: .semibold))
                }//: Button
                .fixedSize()
                .buttonStyle(PlainButtonStyle())
                .foregroundColor(.accentColor)
            }//: HStack
            
            Spacer()
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink(destination: DetailedView(note: notes[i], count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundColor(.accentColor)
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                                
                            }//: HStack
                        }//: NavigationLink
                    }//: Loop
                    .onDelete(perform: delete)
                }
            } else {
                Spacer()
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .opacity(0.25)
                    .padding(25)
                Spacer()
            }
        }//: VStack
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
        
    }
}


// Mark: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

