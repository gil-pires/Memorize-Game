//
//  ContentView.swift
//  Memorize
//
//  Created by Gil Pires on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["✈️", "🚕","⛴", "🚆", "🚀","🚁", "🚠", "🛵", "🛻","🚲","🏍","🚜", "🚤", "⛵️", "🛴", "🚡", "🚗", "🚞", "🚛", "🚓"]
    @State var emojiCount = 6
    
    var body: some View {
        VStack{
            HStack{
                ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                    CardView(content: emoji)
                    
                }
            }
            Spacer(minLength: 20)
            HStack{
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
    
    var remove: some View {
        Button{
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View{
        Button{
            if emojiCount < emojis.count{
                emojiCount += 1
            }
        }label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View{
    var  content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            }else{
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
