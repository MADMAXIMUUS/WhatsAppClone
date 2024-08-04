//
//  BubbleAudioView.swift
//  WhatsAppClone
//
//  Created by Максим Нечаев on 04.08.2024.
//

import SwiftUI

struct BubbleAudioView: View {
    let item: MessageItem
    
    @State private var sliderValue: Double = 0
    @State private var sliderRange:ClosedRange<Double> = 0...20
    
    var body: some View {
        VStack(alignment: item.horizontalAlignment, spacing: 3){
            HStack{
                playButton()
                Slider(value: $sliderValue, in: sliderRange)
                    .tint(.gray)
                
                Text("04:00")
                    .foregroundStyle(.gray)
            }
            .padding(10)
            .background{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.gray.opacity(0.1))
            }
            .padding(5)
            .background(item.background)
            
            timeStampTextView()
        }
        .shadow(color: Color(.systemGray3).opacity(0.1), radius: 10, x: 0, y: 20)
        .frame(maxWidth: .infinity, alignment: item.aligment)
        .padding(.leading, item.direction == .received ? 5 : 100)
        .padding(.trailing, item.direction == .received ? 100 : 5)
    }
    
    private func playButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "play.fill")
                .padding(10)
                .background{
                    Circle()
                        .fill(item.direction == .received ? .green : .white)
                }
                .foregroundStyle(item.direction == .received ? .white : .black)
        }
    }
    
    private func timeStampTextView() -> some View {
        HStack{
            Text("12:44 PM")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            
            if item.direction ==  .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15, height: 15)
                    .foregroundStyle(Color(.systemBlue))
            }
            
        }
    }
}

#Preview {
    ScrollView{
        BubbleAudioView(item: .sentPlaceholder)
        BubbleAudioView(item: .receivedPlaceholder)
    }
    .frame(maxWidth: .infinity)
    .background(.gray.opacity(0.1))
    .onAppear{
        let thumb = UIImage(systemName: "circle.fill")
        UISlider.appearance().setThumbImage(thumb, for: .normal)
    }
}
