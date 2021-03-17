//
//  ContentView.swift
//  SwiftRotationEffect
//
//  Created by Macbook Pro on 17.03.2021.
//

import SwiftUI

struct ContentView: View {
@State var open=false
    @State var offset:CGFloat = UIScreen.main.bounds.height

    var body: some View {
        ZStack{
            
            Button(action: {
                self.offset=0
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                    self.open.toggle()
                }
            }, label: {
            Text("Open")
        })//button
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .top, endPoint: .bottom)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6){
                            self.offset = -UIScreen.main.bounds.height
                        }
                    }, label: {
                        Image(systemName: "xmark.circle").font(.title)
                    })//button
                    .foregroundColor(.white)
                }//hstack
                .padding()
                Spacer()
            }//vstack
        }//zstack
        .cornerRadius(30)
        .padding()
        .offset(y:self.offset)
        .rotation3DEffect(
            .init(degrees: self.open ? 0 : 45),
                axis:(x:self.open ? 0 : 1.0, y:0, z:0)
        )//endrotation
        .opacity(self.offset == -UIScreen.main.bounds.height ? 0:1.0)
        }//zstack
        .animation(Animation.easeOut(duration:0.5))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
