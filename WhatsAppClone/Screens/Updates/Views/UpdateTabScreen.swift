//
//  UpdateTabScreen.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 31.07.2024.
//

import SwiftUI

struct UpdateTabScreen: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack{
            List{
                StatusSectionHeader()
                    .listRowBackground(Color.clear)
                StatusSection()
                Section{
                    RecentUpdatesItemView()
                } header: {
                    Text("Recent Updates")
                }
                Section{
                    ChannelListView()
                } header: {
                    channelSectionHeader()
                }
            }
            .listStyle(.grouped)
            .navigationTitle("Updates")
            .searchable(text: $searchText)
        }
    }
    
    private func channelSectionHeader() -> some View {
        HStack{
            Text("Channels")
                .bold()
                .font(.title3)
                .textCase(nil)
                .foregroundStyle(.whatsAppBlack)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "plus")
                    .padding(7)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
            }
        }
    }
}

extension UpdateTabScreen {
    enum Constant {
        static let imageDimen: CGFloat = 55
    }
}

private struct StatusSectionHeader: View {
    var body: some View {
        HStack(alignment: .top){
            Image(systemName: "circle.dashed")
                .foregroundStyle(.blue)
                .imageScale(.large)
            
            (
                Text("Use Status to share photos, text and videos that desappear in 24 hours.")
                +
                Text(" ")
                +
                Text("Status Privacy")
                    .foregroundStyle(.blue).bold()
            )
            
            Image(systemName:"xmark").foregroundStyle(.gray)
        }
        .padding()
        .background(.whatsAppWhite)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 10,
                style: .continuous
            )
        )
    }
}

private struct StatusSection: View {
    var body: some View {
        HStack{
            Circle()
                .frame(
                    width: UpdateTabScreen.Constant.imageDimen,
                    height: UpdateTabScreen.Constant.imageDimen
                )
            
            VStack(alignment: .leading){
                Text("My Status")
                    .font(.callout)
                    .bold()
                
                Text("Add to my status")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
            cameraButton()
            pencilButton()
        }
    }
    
    private func cameraButton() -> some View{
        Button {
            
        } label: {
            Image(systemName: "camera.fill")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        }
    }
    
    private func pencilButton() -> some View{
        Button {
            
        } label: {
            Image(systemName: "pencil")
                .padding(10)
                .background(Color(.systemGray5))
                .clipShape(Circle())
                .bold()
        }
    }
}

private struct RecentUpdatesItemView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(
                    width: UpdateTabScreen.Constant.imageDimen,
                    height: UpdateTabScreen.Constant.imageDimen
                )
            
            VStack(alignment: .leading){
                Text("Joseph Smith")
                    .font(.callout)
                    .bold()
                
                Text("1h ago")
                    .foregroundStyle(.gray)
                    .font(.system(size: 15))
            }
            
            Spacer()
        }
    }
}

private struct ChannelListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Stay updated on topics that matter to you. Find channels to follow below.")
                .foregroundStyle(.gray)
                .font(.callout)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(0..<5){ _ in
                        SuggestedChannelItemView()
                    }
                }
            }
            
            Button("Explore More"){}
                .tint(.blue)
                .buttonStyle(.borderedProminent)
                .clipShape(Capsule())
                .padding(.vertical)
        }
    }
}

private struct SuggestedChannelItemView: View {
    var body: some View {
        VStack{
            Circle()
                .frame(width: 55, height: 55)
            
            Text("Real Madrid C.F.")
            
            Button{
                
            } label: {
                Text("Follow")
                    .bold()
                    .padding(5)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue.opacity(0.2))
                    .clipShape(Capsule())
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical)
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.systemGray4), lineWidth: 1)
        }
    }
}

#Preview {
    UpdateTabScreen()
}
