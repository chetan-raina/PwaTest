//
//  ContentView.swift
//  Shared
//
//  Created by Chetan Raina on 22/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(
                destination: PwaWebView()
            ) {
                Text("Enter pwa")
            }
            .navigationBarTitle(Text("Pwa"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
