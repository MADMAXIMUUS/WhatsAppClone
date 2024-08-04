//
//  MessageListView.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 02.08.2024.
//

import SwiftUI

struct MessageListView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> MessageListController {
        let messageListController = MessageListController()
        return messageListController
    }
    
    func updateUIViewController(_ uiViewController: MessageListController, context: Context) {
        
    }
}

#Preview {
    MessageListView()
}
