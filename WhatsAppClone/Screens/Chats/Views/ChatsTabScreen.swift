//
//  ChannelTabScreen.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 02.08.2024.
//

import SwiftUI

struct ChatsTabScreen: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            List{
                archivedButton()
                ForEach(0..<1){ _ in
                    ChatItemView()
                }
                inboxFooterView()
                    .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .navigationTitle("Chats")
            .searchable(text: $searchText)
            .toolbar{
                leadingNavItems()
                trailingNavItem()
            }
        }
    }
}


extension ChatsTabScreen {
    
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent{
        ToolbarItem(placement: .topBarLeading){
            Menu {
                Button {
                    
                } label: {
                    Label("Select Chats", systemImage: "checkmark.circle")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing){
            HStack{
                Button {
                    
                } label: {
                    Image(.circle)
                }
                Button {
                    
                } label: {
                    Image(systemName: "camera")
                }
                Button {
                    
                } label: {
                    Image(.plus)
                }
            }
        }
    }
    
    private func archivedButton() -> some View {
        Button{
            
        } label:{
            Label("Archived", systemImage: "archivebox.fill")
                .bold()
                .padding()
                .foregroundStyle(.gray)
        }
    }
    
    private func inboxFooterView() -> some View {
        HStack {
            Image(systemName: "lock.fill")
            
            (
                Text("Your personal messages are ")
                +
                Text("end-to-end encrypted")
                    .foregroundStyle(.blue)
            )
        }
        .foregroundStyle(.gray)
        .font(.caption)
        .padding(.horizontal)
    }
}

#Preview {
    ChatsTabScreen()
}
