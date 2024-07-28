//
//  ChatListView.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/28.
//

import SwiftUI

struct ChatListView: View {
    @StateObject var viewModel = ChatListViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    List(viewModel.items) { model in
                        NavigationLink {
                            MessageHomeView()
                        } label: {
                            ChatCell(chatModel: model)
                        }
                    }
                    .listStyle(.plain) // 기본 리스트 스타일 설정
                    .background(Color.white) // 리스트 배경을 투명으로 설정
                }
                
            }
            .navigationTitle("Chat List")
        }
        .onAppear {
            viewModel.load()
        }
    }
}

#Preview {
    ChatListView()
}
