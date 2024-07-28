//
//  ChatCell.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/25.
//

import SwiftUI

struct ChatCell: View {
    var chatModel: ChatListModel
    
    var body: some View {
        HStack(alignment: .center) {
            URLImageView(url: chatModel.thumnail)
                .frame(width: 80, height: 80)
                .cornerRadius(40)
                .clipShape(.circle)

            Text(chatModel.name)
                .padding(.horizontal, 10)
            
            Spacer()
        }
        .padding(.top, 5)
    }
}

#Preview {
    ChatCell(chatModel: .init(name: "", thumnail: nil))
}
