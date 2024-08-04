//
//  MessageItem.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 02.08.2024.
//

import Foundation
import SwiftUI

struct MessageItem: Identifiable {
    
    let id = UUID().uuidString
    let text: String
    let type: MessageType
    let direction: MessageDirection
    
    static let sentPlaceholder = MessageItem(text: "Holy Spagetti", type: .text, direction: .sent)
    static let receivedPlaceholder = MessageItem(text: "Holy Spagetti",type: .text, direction: .received)
    
    var aligment: Alignment {
        return direction == .received ? .leading : .trailing
    }
    
    var horizontalAlignment: HorizontalAlignment {
        return direction == .received ? .leading : .trailing
    }
    
    var backgroundColor: Color {
        return direction == .sent ? .bubbleGreen : .bubbleWhite
    }
    
    var background: some View{
        let scale = direction == .sent ? 1 : -1
        return MessageBubbleBackground(cornerRadius: 12)
            .fill(backgroundColor)
            .scaleEffect(CGSize(width: scale, height: 1), anchor: .center)
    }
    
    static let stubMessages: [MessageItem] = [
        MessageItem(text: "Hi There", type: .text, direction: .sent),
        MessageItem(text: "Check out this Photo", type: .photo, direction: .received),
        MessageItem(text: "Play this Video", type: .video, direction: .sent),
        MessageItem(text: "", type: .audio, direction: .received),
    ]
}

enum MessageType {
    case text, photo, video, audio
}

enum MessageDirection {
    case sent, received
    
    static var random: MessageDirection{
        return [MessageDirection.sent, .received].randomElement() ?? .sent
    }
}
