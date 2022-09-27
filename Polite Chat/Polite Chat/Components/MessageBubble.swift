//
//  MessageBubble.swift
//  Polite Chat
//
//  Created by Roberto Gakiya Cruz on 20/09/22.
//

import SwiftUI

struct MessageBubble: View {
    
    @State private var showTime = false
    
    var message: Message
    
    var body: some View {
    
        VStack(alignment: message.received ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.received ? Color("Gray") : Color("Green"))
                    .cornerRadius(30)
            }
            .frame(maxWidth: 300, alignment: message.received ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            
            /*if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.received ? .leading : .trailing)
            }*/
            
        }// VStack
        .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
        .padding(message.received ? .leading : .trailing)
        .padding(.horizontal, 10)
    }
}//MessageBubble: View

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message(id: "1234", text: "Testing Bubbles", received: true, timestamp: Date().millisecondsSince1970))
    }
}
