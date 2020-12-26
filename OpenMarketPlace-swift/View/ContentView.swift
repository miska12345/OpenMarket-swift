//
//  ContentView.swift
//  OpenMarketPlace-swift
//
//  Created by ShangJin Li on 9/21/20.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var session : SessionManager
    var body: some View {
        LoginView(session: _session)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
