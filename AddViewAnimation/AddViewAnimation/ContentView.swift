//
//  ContentView.swift
//  AddViewAnimation
//
//  Created by Nerimene on 4/5/2021.
//

import SwiftUI

struct ContentView: View {
    // MARK:- variables
    @State var isAnimating: Bool = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            ZStack {
                ExpandingView(expand: $isAnimating, direction: .bottom, symbolName: "note.text")
                ExpandingView(expand: $isAnimating, direction: .left, symbolName: "doc")
                ExpandingView(expand: $isAnimating, direction: .top, symbolName: "photo")
                ExpandingView(expand: $isAnimating, direction: .right, symbolName: "mic.fill")
                Image(systemName: "plus")
                    .font(.system(size: 40, weight:  self.isAnimating ? .regular : .semibold, design: .rounded))
                    .foregroundColor(self.isAnimating ? Color.white : Color.black)
                    .rotationEffect(self.isAnimating ? .degrees(45) : .degrees(0))
                    .scaleEffect(self.isAnimating ? 3 : 1)
                    .opacity(self.isAnimating ? 0.5 : 1)
                    .animation(Animation.spring(response: 0.35, dampingFraction: 0.85, blendDuration: 1))
                    .onTapGesture {
                        self.isAnimating.toggle()
                    }
            }.frame(height: 300)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
