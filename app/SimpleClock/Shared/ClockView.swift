//
//  ContentView.swift
//  Shared
//
//  Created by John Ye on 2021/12/16.
//

import SwiftUI

struct ClockView: View {
    @State var hoursAndMinutes = ""
    @State var seconds = ""
    @State var brightValue = 0.0    // -1(dark) ~ 0(bright)
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                HStack(alignment: .bottom, spacing: -10) {
                    Text(hoursAndMinutes)
                        .font(.custom("Helvetica", size: 500, relativeTo: .largeTitle))
                        .fontWeight(.medium)
                        .onReceive(timer) { input in
                            hoursAndMinutes = input.formatHoursAndMinutes()
                        }
                        .brightness(Double(brightValue))
                    Text(seconds)
                        .font(.custom("Helvetica", size: 20, relativeTo: .caption))
                        .onReceive(timer) { input in
                            seconds = input.formatSeconds()
                        }
                        .frame(width: 30)
                        .brightness(Double(brightValue))
                }
                
                .frame(width: geo.size.width * 0.8, height: geo.size.height * 0.8)
                .foregroundColor(.white)
                .minimumScaleFactor(0.01)
                .gesture(DragGesture(minimumDistance: 10, coordinateSpace: .local)
                            .onEnded({ value in
                    if value.translation.height < 0 {
                        // swipe up
                        print("swipe up")
                        if brightValue < -0.2 {
                            brightValue += 0.2
                            print("brightValue + 0.2, now is \(brightValue)")
                        }
                    }
                    if value.translation.height > 0 {
                        // swipe down
                        print("swipe down")
                        if brightValue > -0.8 {
                            brightValue -= 0.2
                            print("brightValue - 0.2, now is \(brightValue)")
                        }
                    }
                }))
                
            }
        }
#if os(iOS)
        .statusBar(hidden: true)
#endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}



