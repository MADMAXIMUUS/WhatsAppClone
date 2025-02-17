//
//  CustomModifiers.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 03.08.2024.
//

import SwiftUI

private struct BubbleTailModifier: ViewModifier {
    var direction: MessageDirection
    
    func body(content: Content) -> some View{
        content.overlay(alignment: direction == .received ? .bottomLeading : .bottomTrailing){
            BubbleTailView(direction: direction)
        }
    }
}

extension View {
    func applyTail(_ direction: MessageDirection) -> some View {
        self.modifier(BubbleTailModifier(direction: direction))
    }
}
