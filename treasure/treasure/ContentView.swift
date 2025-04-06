//
//  ContentView.swift
//  treasure
//
//  Created by Lukas Cao on 4/5/25.
//

import SwiftUI

fileprivate let url1 = URL(string: "https://diamondhacks-25.s3.us-west-1.amazonaws.com/videos/2f5158ec-8023-4ca5-9912-e3b2aa8105e8.mp4")!
fileprivate let url2 = URL(string: "https://diamondhacks-25.s3.us-west-1.amazonaws.com/videos/b2b1a4f1-423c-46f7-b821-99986a3726e1.mp4")!
fileprivate let url3 = URL(string: "https://diamondhacks-25.s3.us-west-1.amazonaws.com/videos/973c7e60-bccb-4a26-8aef-eac2c5ed4050.mp4")!
fileprivate let url4 = URL(string: "https://diamondhacks-25.s3.us-west-1.amazonaws.com/videos/116ba589-6108-44f5-8b22-4514d80f55d3.mp4")!
var videos : [URL] = [url1, url2, url3, url4]
//DoomScrollFeed(videoURLs: videos)*/


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
                else {
                    Search()
                }
            }
            else {
                DoomScrollFeed(videoURLs: videos)
            }
        }
    }
}

#Preview {
    ContentView()
}
