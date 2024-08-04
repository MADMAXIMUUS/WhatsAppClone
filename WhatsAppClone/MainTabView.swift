//
//  MainTabView.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 31.07.2024.
//

import SwiftUI

struct MainTabView: View {
    
    init() {
        makeTabBarOpaque()
        let thumb = UIImage(systemName: "circle.fill")
        UISlider.appearance().setThumbImage(thumb, for: .normal)
    }
    
    var body: some View {
        TabView{
            UpdateTabScreen()
                .tabItem {
                    Image(systemName: Tab.updates.icon)
                    Text(Tab.updates.title)
                }
            CallsTabScreen()
                .tabItem {
                    Image(systemName: Tab.calls.icon)
                    Text(Tab.calls.title)
                }
            CommunityTabScreen()
                .tabItem {
                    Image(systemName: Tab.comunities.icon)
                    Text(Tab.comunities.title)
                }
            ChatsTabScreen()
                .tabItem {
                    Image(systemName: Tab.chats.icon)
                    Text(Tab.chats.title)
                }
            SettingsTabScreen()
                .tabItem {
                    Image(systemName: Tab.settings.icon)
                    Text(Tab.settings.title)
                }
        }
    }
    
    private func makeTabBarOpaque(){
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
}

extension MainTabView{
    private func placeHolderItemView(_ title: String) -> some View{
        ScrollView{
            VStack{
                ForEach(0..<120){ _ in
                    Text(title)
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(Color.green.opacity(0.5))
                }
            }
        }
    }
    
    
    private enum Tab: String{
        case updates, calls, comunities, chats, settings
        
        fileprivate var title: String {
            return rawValue.capitalized
        }
        
        
        fileprivate var icon: String {
            switch self {
            case .updates:
                return "circle.dashed.inset.filled"
            case .calls:
                return "phone"
            case .comunities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
}

#Preview {
    MainTabView()
}
