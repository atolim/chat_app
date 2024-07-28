//
//  ChatListModel.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/25.
//

import Foundation

class ChatListModel: Identifiable, ObservableObject {
    var name: String = ""
    var thumnail: String? = nil
    let id: UUID = UUID()
    
    init(name: String, thumnail: String?) {
        self.name = name
        self.thumnail = thumnail
    }
}
