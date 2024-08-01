//
//  CommunityTabScreen.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 02.08.2024.
//

import SwiftUI

struct CommunityTabScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    Image(.communities)
                    
                    Group{
                        Text("Stay connected with a community")
                        
                        Text("Communities bring members together in topic-based groups. Any community you're added to will appear here.")
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 5)
                    
                    Button("See example communities >"){
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Button{
                        
                    } label: {
                        Label("New Community", systemImage: "plus")
                            .bold()
                            
                    }
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    .padding()
                }
                .padding()
                .navigationTitle("Communities")
            }
        }
    }
}

#Preview {
    CommunityTabScreen()
}
