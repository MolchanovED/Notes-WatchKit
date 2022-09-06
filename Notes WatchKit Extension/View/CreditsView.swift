//
//  CreditsView.swift
//  Notes WatchKit Extension
//
//  Created by Egor Molchanov on 03.09.2022.
//

import SwiftUI

struct CreditsView: View {
    // Mark: - Proprety
    
    // Mark: - Body
    var body: some View {
        VStack(spacing: 3) {
            // Profile Image
            Image("developer-no1")
                .resizable()
                .scaledToFit()
                .layoutPriority(1)
            // Header
            HeaderView(title: "Credits")
            // Content
            Text("Molchanov Egor")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.secondary)
                .fontWeight(.light)
        }//: VStack
    }
}


// Mark: - Preview
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
