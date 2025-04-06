//
//  home.swift
//  treasure
//
//  Created by B Miyamoto on 4/5/25.
//
import SwiftUI

struct HomePage: View {
    
    @State private var selectedTab: Tab = .home // Track the selected tab
    
    enum Tab {
        case home, profile, search
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Title
                    Text("APP NAME HERE")
                        .font(Font.custom("Cochin", size: 40).weight(.semibold))
                        .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                        .padding(.top, 10)
                        .padding(.horizontal)
                    
                    // Separator
                    Rectangle()
                        .frame(height: 6)
                        .foregroundColor(Color(red: 0.82, green: 0.83, blue: 0.83))
                        .frame(maxWidth: .infinity)
                    
                    // Horizontal scrolling content cards
                    // Section Header for recommended reels
                    HStack {
                        Text("For You")
                            .font(Font.custom("Cochin", size: 24).weight(.semibold))
                            .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                        
                        Spacer()
                        
                        Text("< >")
                            .font(Font.custom("Inter", size: 14).weight(.medium))
                            .foregroundColor(Color.gray)
                    }
                    .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ContentCard(title: "Sautéed Salmon", username: "user123_")
                            ContentCard(title: "Banana Pancakes", username: "user_iLovePancakes")
                            ContentCard(title: "Raspberry Shortcake", username: "lolidkwhattoputhere")
                            ContentCard(title: "Chuck 70 Hi Sneakers", username: "Converse")
                            ContentCard(title: "good kid, m.A.A.d city", username: "Kendrick Lamar")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
                
                // Separator
                Rectangle()
                    .frame(height: 6)
                    .foregroundColor(Color(red: 0.82, green: 0.83, blue: 0.83))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical)
                
                // Section Header for Friend Activity
                HStack {
                    Text("Friend Activity")
                        .font(Font.custom("Cochin", size: 24).weight(.semibold))
                        .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                    
                    Spacer()
                    
                }
                .padding(.horizontal)
                
                // --- Friend Activity
                HStack(spacing: 16) {
                    FriendsActivity(
                        profileImage: Image(systemName: "person.circle.fill"),
                        username: "Stephanie Chung",
                        action: "completed this reels series.",
                        completedReels: ["Reel 1", "Reel 2", "Reel 3", "Reel 4"]
                    )
                    .padding(.horizontal)
                }
                
                HStack(spacing: 16) {
                    FriendsActivity(
                        profileImage: Image(systemName: "person.circle.fill"),
                        username: "Stephanie Chung",
                        action: "recently watched these reels.",
                        completedReels: ["Reel 1", "Reel 2", "Reel 3", "Reel 4"]
                    )
                    .padding(.horizontal)
                }
                
                HStack(spacing: 16) {
                    FriendsActivity(
                        profileImage: Image(systemName: "person.circle.fill"),
                        username: "Stephanie Chung",
                        action: "liked these reels.",
                        completedReels: ["Reel 1", "Reel 2", "Reel 3", "Reel 4"]
                    )
                    .padding(.horizontal)
                }
                
                HStack(spacing: 16) {
                    FriendsActivity(
                        profileImage: Image(systemName: "person.circle.fill"),
                        username: "Stephanie Chung",
                        action: "recommended these reels.",
                        completedReels: ["Reel 1", "Reel 2", "Reel 3", "Reel 4"]
                    )
                    .padding(.horizontal)
                }
            }
                
                
            // Bottom Navigation Bar
            VStack {
                Spacer() // Push bar to bottom
                HStack{
                    // Home Tab
                    
                    Button(action: {
                        selectedTab = .home
                    }) {
                        VStack {
                            Image(systemName: "house.fill")
                                .foregroundColor(selectedTab == .home ? .black : .gray)
                            Text("Home")
                                .font(.caption)
                                .foregroundColor(selectedTab == .home ? .black : .gray)
                        }
                        .padding(.horizontal, 40)
                    }
                    Spacer()
                                    
                    // Search Tab
                    Button(action: {
                        selectedTab = .search
                    }) {
                        VStack {
                        Image(systemName: "magnifyingglass")
                                .foregroundColor(selectedTab == .search ? .black : .gray)
                        Text("Search")
                            .font(.caption)
                            .foregroundColor(selectedTab == .search ? .black : .gray)
                        }
                        .padding()
                    }
                            
                    Spacer()
                    
                    // Profile Tab
                    Button(action: {
                        selectedTab = .profile
                    }) {
                        VStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(selectedTab == .profile ? .black : .gray)
                            Text("Profile")
                                .font(.caption)
                                .foregroundColor(selectedTab == .profile ? .black : .gray)
                        }
                        .padding(.horizontal, 40)
                    }
                }
                .frame(height: 70)
                .background(Color.white)
                .shadow(radius: 10)
            }
        }
    }
}

// MARK: - Reusable Components

struct ContentCard: View {
    var title: String
    var username: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(Font.custom("Inter", size: 14).weight(.semibold))
                Text("@\(username)")
                    .font(Font.custom("Inter", size: 12))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(width: 206, height: 300)
        .background(Color(red: 0.85, green: 0.89, blue: 0.76))
        .cornerRadius(10)
    }
}

struct FriendsActivity: View {
    var profileImage: Image
    var username: String
    var action: String
    var completedReels: [String]
        
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Username message and profile image
            HStack(spacing: 16) {
                // Profile image to the left
                profileImage
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    //.shadow(radius: 4)
                
                // Username message
                Text("\(username) \(action)")
                    .font(Font.custom("Cochin", size: 16).weight(.medium))
                    .padding(.trailing)
            }
            
            // Horizontal scrollable rectangles (reels)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(completedReels, id: \.self) { reel in
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 120, height: 80)
                            .cornerRadius(8)
                            .overlay(
                                Text(reel)
                                    .font(Font.custom("Inter", size: 12).weight(.medium))
                                    .foregroundColor(.black)
                                    .padding(8)
                            )
                    }
                }
            }
            
            // Separator
            Rectangle()
                .frame(height: 2)
                .foregroundColor(Color(red: 0.82, green: 0.83, blue: 0.83))
                .frame(maxWidth: .infinity)
                .padding(.vertical)
        }
        
    }
}


// MARK: - Preview Provider
#Preview {
    HomePage()
}


