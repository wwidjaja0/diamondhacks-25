//
//  profile.swift
//  treasure
//
//  Created by B Miyamoto on 4/5/25.
//

import SwiftUI

struct Profile: View {
    
    @State private var selectedTab: Tab = .profile
    
    enum Tab {
        case home, profile, search, post
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 24) {
                    // Title
                    Text("Profile")
                        .font(Font.custom("Cochin", size: 30).weight(.semibold))
                        .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                        .padding(.top, 10)
                        .padding(.horizontal)
                    
                    // Separator
                    Rectangle()
                        .frame(height: 4)
                        .foregroundColor(Color(red: 0.82, green: 0.83, blue: 0.83))
                        .frame(maxWidth: .infinity)
                    
                    // Your profile info
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Stephanie Chung")
                                .font(Font.custom("Cochin", size: 25).weight(.semibold))
                                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                                .padding(.top, 10)
                            
                            Text("youremail@ucsd.com")
                                .font(Font.custom("Inter", size: 16).weight(.semibold))
                                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                                .textCase(.none)
                            
                            Button(action: {
                                // edit action
                            }) {
                                Text("Edit")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 16)
                                    .background(Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                            }
                        }
                        
                        Spacer()
                        
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                    }
                    .padding(.horizontal)
                    
                    // MARK: - Interests Placeholder Section
                    VStack(spacing: 8) {
                        Image(systemName: "sparkles")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.black)
                        
                        Text("What interests you!")
                            .font(Font.custom("Cochin", size: 20).weight(.semibold))
                            .foregroundColor(.black)
                        
                        Text("You don't have any learning interests listed. Tell us what you want to learn, and we'll recommend relevant reels to you.")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        Button(action: {
                            // add interest action
                        }) {
                            Text("+ Add my learning interests")
                                .font(.system(size: 14, weight: .regular))
                                .foregroundColor(.black)
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.93, green: 0.95, blue: 0.90))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // MARK: - Account Section
                    HStack {
                        Text("Account")
                            .font(Font.custom("Cochin", size: 24).weight(.semibold))
                            .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                        
                        Spacer()
                        
                        Text("View all")
                            .font(Font.custom("Inter", size: 14).weight(.medium))
                            .foregroundColor(Color.gray)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForYou(category: "Completed Series")
                            ForYou(category: "In Progress")
                            ForYou(category: "Friends")
                        }
                        .padding(.horizontal)
                    }
                    
                }
                .padding(.vertical)
                }
                .padding(.vertical)
            }

            // Bottom nav bar
            HStack {
                Spacer()
                Button(action: {
                    selectedTab = .home
                    ViewManager.lastPage = "Home"
                }) {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Home")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == .home ? .black : .gray)
                }
                Spacer()
                Button(action: {
                    selectedTab = .post
                }) {
                    VStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Post")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == .post ? .black : .gray)
                }
                Spacer()
                Button(action: {
                    ViewManager.lastPage = "Search"
                    selectedTab = .search
                }) {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == .search ? .black : .gray)
                }
                Spacer()
                Button(action: {
                    selectedTab = .profile
                }) {
                    VStack {
                        Image(systemName: "person.fill")
                        Text("Profile")
                            .font(.caption)
                    }
                    .foregroundColor(selectedTab == .profile ? .black : .gray)
                }
                Spacer()
            }
            .padding()
            .background(Color.white)
            .shadow(radius: 5)
        }

    
    struct ForYou: View {
        var category: String
        
        var body: some View {
            VStack(alignment: .leading, spacing: 8) {
                Spacer()
                VStack(alignment: .leading, spacing: 4) {
                    Text(category)
                        .font(Font.custom("Inter", size: 14).weight(.bold))
                }
            }
            .padding()
            .frame(width: 120, height: 120)
            .background(Color(red: 0.93, green: 0.95, blue: 0.90))
            .cornerRadius(10)
        }
    }
}


// MARK: - Preview Provider
#Preview {
    Profile()
}
