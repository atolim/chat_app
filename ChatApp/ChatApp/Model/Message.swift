//
//  Message.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/24.
//

import Foundation

struct Message: Hashable {
    var id = UUID()
    var content: String
    var isCurrentUser: Bool
}
