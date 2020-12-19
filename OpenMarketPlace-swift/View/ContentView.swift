//
//  ContentView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LoginView(session: SessionManager())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
