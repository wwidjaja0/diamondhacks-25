//
//  ContentView.swift
//  treasure
//
//  Created by Lukas Cao on 4/5/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var manageView = ViewManager
    var body: some View {
        if !manageView.signed_in {
            if !manageView.signing_up {
                welcomePage()
            }
            else if !manageView.second_registrationPage {
                Registration1()
            }
            else {
                if manageView.end_sign_up {
                    end()
                }
                else {
                    registration2()
                }
            }
        }
        else {
            if !manageView.doomScrolling {
                if manageView.lastPage == "" || manageView.lastPage == "Home" {
                    HomePage()
                }
                else if manageView.lastPage == "Search" {
                    Search()
                }
                else {
                    Profile()
                }
            }
            else {
                if !ViewManager.currentVids.isEmpty {
                    DoomScrollFeed(videoMetaDatas: ViewManager.currentVids)
                }
                else {
                    API_Problem()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
