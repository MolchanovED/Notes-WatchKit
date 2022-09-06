//
//  DetailedView.swift
//  Notes WatchKit Extension
//
//  Created by Egor Molchanov on 03.09.2022.
//

import SwiftUI

struct DetailedView: View {
    // Mark: - Property
    
    let note: Note
    let count: Int
    let index: Int
    
    @State private var isCreditsPresent: Bool = false
    @State private var isSettingsPresent: Bool = false
    
    // Mark: - Body
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            // Header
            
            HeaderView(title: "")
            // Content
            
            Spacer()
            
            ScrollView(.vertical) {
                Text(note.text)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
            }//: Scroll
            
            Spacer()
            
            // Footer
            
            HStack(alignment: .center) {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .onTapGesture {
                        isSettingsPresent.toggle()
                    }.sheet(isPresented: $isSettingsPresent, content: {
                        SettingsView()
                    })
                
                Spacer()
                
                Text("\(count) / \(index + 1)")
                
                Spacer()
                
                Image(systemName: "info.circle")
                    .imageScale(.large)
                    .onTapGesture {
                        isCreditsPresent.toggle()
                    }.sheet(isPresented: $isCreditsPresent, content: {
                        CreditsView()
                    })
            }//: HStack
            .foregroundColor(.secondary)
            
        }//: VStack
    }
}



// Mark: - Preview
struct DetailedView_Previews: PreviewProvider {
    static var sampleData: Note = Note(id: UUID(), text: "Hello World")
    static var previews: some View {
        DetailedView(note: sampleData, count: 5, index: 1)
    }
}

