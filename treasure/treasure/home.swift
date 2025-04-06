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
        case home, profile, search, post
    }
    
    var body: some View {
        ZStack {
            ScrollView(.vertical) {
                VStack(alignment: .leading, spacing: 24) {
                    
                    // Title
                    Text("1Life")
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
                        username: "DiamondHacks",
                        action: "completed this reels series.",
                        completedReels: ["https://plus.unsplash.com/premium_photo-1726837285699-3d9e8788e7c8?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://plus.unsplash.com/premium_photo-1692193552327-3458ef3817c0?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://plus.unsplash.com/premium_photo-1664372899525-d99a419fd21a?q=80&w=3094&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "https://images.unsplash.com/photo-1642075191572-9992f5f290c2?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"]
                    )
                    .padding(.horizontal)
                }
                
                HStack(spacing: 16) {
                    FriendsActivity(
                        profileImage: Image(systemName: "star.circle.fill"),
                        username: "stephanie",
                        action: "completed this reels series.",
                        completedReels: ["https://images.unsplash.com/photo-1707190981752-5aca6bb786db?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG93JTIwdG8lMjB0aWUlMjBhJTIwdGllfGVufDB8fDB8fHww", "https://plus.unsplash.com/premium_photo-1663126722936-dbaed23fdf7b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8Y2xlYW4lMjBmaWx0cmF0aW9ufGVufDB8fDB8fHww", "https://images.unsplash.com/photo-1625047509248-ec889cbff17f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8Y2FyJTIwbWFpbnRlbmVuY2V8ZW58MHx8MHx8fDA%3D", "https://plus.unsplash.com/premium_photo-1678139487806-b32112def40f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dGF4ZXN8ZW58MHx8MHx8fDA%3D"]
                    )
                    .padding(.horizontal)
                }
                
                HStack(spacing: 16) {
                    FriendsActivity(
                        profileImage: Image(systemName: "heart.circle.fill"),
                        username: "lukas",
                        action: "completed this reels series.",
                        completedReels: ["https://plus.unsplash.com/premium_photo-1663047910718-c8758a6785e9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGV0JTIwY2FyZXxlbnwwfHwwfHx8MA%3D%3D", "https://plus.unsplash.com/premium_photo-1663040477032-0cb4ee5402bc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cGV0JTIwY2FyZXxlbnwwfHwwfHx8MA%3D%3D", "https://plus.unsplash.com/premium_photo-1665408511519-7a7c17cb6b93?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGxhbnQlMjBjYXJlfGVufDB8fDB8fHww", "https://images.unsplash.com/photo-1722411983889-a3a6321ecf8f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aG91c2UlMjBjaG9yZXN8ZW58MHx8MHx8fDA%3D"]
                    )
                    .padding(.horizontal)
                }
                
                HStack(spacing: 16) {
                    FriendsActivity(
                        profileImage: Image(systemName: "moon.circle.fill"),
                        username: "widjaja",
                        action: "completed this reels series.",
                        completedReels: ["https://images.unsplash.com/photo-1581622558663-b2e33377dfb2?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8aG91c2UlMjBjaG9yZXN8ZW58MHx8MHx8fDA%3D", "https://plus.unsplash.com/premium_photo-1678697844527-a090ad16eb8b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8aG91c2UlMjBjaG9yZXN8ZW58MHx8MHx8fDA%3D", "https://images.unsplash.com/photo-1521791136064-7986c2920216?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8am9iJTIwaW50ZXJ2aWV3fGVufDB8fDB8fHww", "https://images.unsplash.com/photo-1630527152680-500b5453fb04?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNldCUyMHRhYmxlfGVufDB8fDB8fHww"]
                    )
                    .padding(.horizontal)
                }
                
                .padding(.top)
                .padding(.bottom, 80)
            }
                
                
            // Bottom Navigation Bar
            VStack {
                Spacer() // Push bar to bottom
                HStack {
                    Spacer()
                    Button(action: {
                        selectedTab = .home
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
                        selectedTab = .search
                        ViewManager.lastPage = "Search"
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
                        ViewManager.lastPage = "Profile"
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
        }
    }
}

// MARK: - Reusable Components

struct ContentCard: View {
    var title: String
    var username: String
    
    var body: some View {
        ZStack {
            Button(action: {
                ViewManager.startDoomScrolling(from: "Home")
            }) {
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
    }
}

struct FriendsActivity: View {
    var profileImage: Image
    var username: String
    var action: String
    var completedReels: [String] // URLs of images
    
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
            
            // Horizontal scrollable rectangles (reels with images)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(completedReels, id: \.self) { reelURL in
                        Rectangle()
                            .fill(Color.gray.opacity(0.2))
                            .frame(width: 120, height: 80)
                            .cornerRadius(8)
                            .overlay(
                                AsyncImage(url: URL(string: reelURL)) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 80)
                                        .cornerRadius(8)
                                        .clipped()
                                } placeholder: {
                                    Color.gray.opacity(0.2) // Placeholder while loading
                                        .frame(width: 120, height: 80)
                                        .cornerRadius(8)
                                }
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


