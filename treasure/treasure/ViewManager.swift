//
//  ViewManager.swift
//  treasure
//
//  Created by Lukas Cao on 4/5/25.
//

import Foundation

var ViewManager = MyViewManager()

class MyViewManager: NSObject, ObservableObject {
    @Published var signed_in: Bool = false
    @Published var signing_up: Bool = false
    @Published var second_registrationPage: Bool = false
    @Published var username: String = ""
    @Published var end_sign_up: Bool = false
    @Published var doomScrolling: Bool = false
    @Published var lastPage: String = ""
    
    
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
        InterfaceAPI.getVideoMixes()
    }
    
    func startDoomScrolling(from: String) {
        DispatchQueue.main.async {
            self.lastPage = from
            self.doomScrolling = true
        }
    }
    
    func endDoomScrolling() {
        DispatchQueue.main.async {
            self.doomScrolling = false
        }
    }
}

