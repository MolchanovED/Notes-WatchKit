//
//  Note.swift
//  Notes WatchKit Extension
//
//  Created by Egor Molchanov on 03.09.2022.
//

import Foundation


struct Note: Codable, Identifiable {
    let id: UUID
    let text: String
}
