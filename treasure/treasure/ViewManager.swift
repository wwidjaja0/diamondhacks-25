//
//  ViewManager.swift
//  treasure
//
//  Created by Lukas Cao on 4/5/25.
//

import Foundation

var ViewManager = MyViewManager()
var videoMix: [VideoMetaData] = []
var cookingVids: [VideoMetaData] = []

class MyViewManager: NSObject, ObservableObject {
    @Published var signed_in: Bool = false
    @Published var signing_up: Bool = false
    @Published var second_registrationPage: Bool = false
    @Published var username: String = ""
    @Published var end_sign_up: Bool = false
    @Published var doomScrolling: Bool = false
    @Published var lastPage: String = ""
    @Published var currentVids: [VideoMetaData] = []
    
    
    func startSignUp() {
        DispatchQueue.main.async {
            self.signing_up = true
        }
    }
    
    func nextRegistrationPage() {
        DispatchQueue.main.async {
            self.second_registrationPage = true
        }
    }
    
    func endSignUp() {
        DispatchQueue.main.async {
            self.end_sign_up = true
        }
        InterfaceAPI.getVideoMixes(completion: { data in
            guard let data = data else { return }
            videoMix = Array(data.dropFirst(2))
        })
        InterfaceAPI.getVideoMixByCat(cat: "cooking", completion: { data in
            guard let data = data else { return }
            cookingVids = data
        })
    }
    
    func startDoomScrolling(from: String) {
        DispatchQueue.main.async {
            self.lastPage = from
            if from == "Home" {
                self.currentVids = videoMix.shuffled()
            }
            else if from == "Search" {
                self.currentVids = cookingVids.shuffled()
            }
            self.doomScrolling = true
        }
    }
    
    func endDoomScrolling() {
        DispatchQueue.main.async {
            self.doomScrolling = false
        }
    }
}

