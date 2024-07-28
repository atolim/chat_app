//
//  ChatApp.swift
//  ChatApp
//
//  Created by 임주영 on 2024/07/24.
//

import SwiftUI

@main
struct ChatApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ChatListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .background(Color.white)
        }
    }
}
