//
//  Message.swift
//  Polite Chat
//
//  Created by Roberto Gakiya Cruz on 20/09/22.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var received: Bool
    var timestamp: Int64
}
