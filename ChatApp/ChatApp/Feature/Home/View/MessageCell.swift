//
//  MessageCell.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/24.
//

import SwiftUI

struct MessageCell: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? .white : .black)
            .background(isCurrentUser ? Color.blue : Color(UIColor.systemGray5))
            .cornerRadius(10)
    }
}

#Preview {
    MessageCell(contentMessage: "Hi", isCurrentUser: false)
}
