//
//  ContentView.swift
//  Random Background Color
//
//  Created by Omar Bakry on 28/12/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var myColor = Color.indigo
    @State private var counter : Int = 0
    let myColors = [
        Color.yellow,
        Color.blue,
        Color.pink,
        Color.orange,
        Color.purple,
        Color.red,
        Color.brown,
        Color.cyan,
        Color.indigo,
        Color.green
    ]
    func getMyColors() async {
        for i in myColors {
            try? await Task.sleep(nanoseconds: 700_000_000)
            myColor = i
            counter = counter + 1
        }
    }
    var body: some View {
        ZStack {
            myColor.ignoresSafeArea()
            Text("\(counter)")
                .font(.system(size: 65, weight: .heavy, design: .default))
                .onAppear(perform: {
                    Task{
                        await getMyColors()
                    }
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
