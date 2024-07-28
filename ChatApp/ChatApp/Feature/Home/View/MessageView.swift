//
//  MessageView.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/24.
//

import SwiftUI

struct MessageView: View {
    var currentMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if !currentMessage.isCurrentUser {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40, alignment: .center)
                    .cornerRadius(20)
            }
            else {
                Spacer()
            }
            MessageCell(contentMessage: currentMessage.content, isCurrentUser: currentMessage.isCurrentUser)
        }
    }
}

#Preview {
    MessageView(currentMessage: Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.", isCurrentUser: false))
}
