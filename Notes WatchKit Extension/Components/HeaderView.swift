//
//  HeaderView.swift
//  Notes WatchKit Extension
//
//  Created by Egor Molchanov on 03.09.2022.
//

import SwiftUI

struct HeaderView: View {
    // Mark: - Property
    
    var title: String = ""
    var body: some View {
        
        // Title
        if title != "" {
            Text(title.uppercased())
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.accentColor)
        }
        // Separator
        
        VStack{
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            }//: HStack
            .foregroundColor(.accentColor)
        }//: VStack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView(title: "Credits")
            HeaderView()
        }
        
    }
}
