//
//  ChatListViewModel.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/28.
//

import Foundation
import Combine

class ChatListViewModel: ObservableObject {
    @Published var listDomain: ChatListDomainType
    @Published var items: [ChatListModel]  = []
    
    private var cancellables: Set<AnyCancellable> = []

    init(domain: ChatListDomainType = ChatListDomain()) {
        self.listDomain = domain
        
        if let domain = domain as? ChatListDomain {
            domain.$chatList
                .receive(on: DispatchQueue.main)
                .assign(to: \.items, on: self)
                .store(in: &cancellables)
        }
    }

    func load() {
        listDomain.load()
    }
}
