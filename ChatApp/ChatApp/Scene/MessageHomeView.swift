//
//  MessageHomeView.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/24.
//

import Combine
import SwiftUI

struct MessageHomeView: View {
    @StateObject var messageBox = MessageLoadUsecase.shared
    @State var newMessage: String = ""
    
    var body: some View {
        ZStack(content: {
            Color(.white)
                .ignoresSafeArea()
            
            VStack {
                ScrollViewReader { proxy in
                    List {
                        ForEach(messageBox.messages, id: \.id) { message in
                            MessageView(currentMessage: message)
                                .id(message)
                        }
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.white)
                    .onChange(of: messageBox.messages, { oldValue, newValue in
                        withAnimation {
                            proxy.scrollTo(messageBox.messages.last, anchor: .bottom)
                        }
                    })
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(messageBox.messages.last, anchor: .bottom)
                        }
                    }
                // send new message
                HStack {
                    TextField("Send a message", text: $newMessage)
                        .textFieldStyle(.roundedBorder)
                    Button(action: sendMessage)   {
                        Image(systemName: "paperplane")
                    }
                }
                .padding()
            }
        }
        })

    }
    
    private func sendMessage() {
        MessageLoadUsecase.shared.sendMessage(newMessage)
        newMessage = ""
    }
}

#Preview {
    MessageHomeView()
}
