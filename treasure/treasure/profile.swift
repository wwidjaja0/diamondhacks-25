//
//  profile.swift
//  treasure
//
//  Created by B Miyamoto on 4/5/25.
//  Image credit to usplash
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
                        .font(Font.custom("Cochin", size: 40).weight(.semibold))
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
                        
                        // Profile image from URL (placeholder used for now)
                        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHVydGxlfGVufDB8fDB8fHww")) { image in image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        } placeholder: {
                                Color.gray
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    
                    // Interests
                    VStack(spacing: 8) {
                        Image(systemName: "sparkles")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundColor(.black)
                        
                        Text("What interests you!")
                            .font(Font.custom("Cochin", size: 20).weight(.semibold))
                            .foregroundColor(.black)
                        
                        Text("Tell us what you want to learn, and we'll recommend relevant reels to you.")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                        
                        //Chosen Interests
                        HStack {
                            VStack(alignment: .leading, spacing: 8) {
                                Button(action: {
                                    // action for Cooking (remove)
                                }) {
                                    Text("-  Cooking")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(.gray)
                                        .cornerRadius(8)
                                }

                                Button(action: {
                                    // action for General Life Skills (remove)
                                }) {
                                    Text("-  General Life Skills")
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.white)
                                        .padding(.vertical, 10)
                                        .padding(.horizontal, 20)
                                        .background(.gray)
                                        .cornerRadius(8)
                                }
                            }
                            Spacer() // pushes VStack all the way left
                        }



                        Spacer(minLength: 30)
                        
                        Button(action: {
                            // add interest action
                        }) {
                            Text("+ Add more learning interests")
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
                    
                    VStack(spacing: 8) {
                        VStack(alignment: .center, spacing: 16) {
                            Text("Invite your friends!")
                                .font(Font.custom("Cochin", size: 24).weight(.semibold))
                                .lineSpacing(30)
                                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                                .multilineTextAlignment(.center)
                            
                            Text("Have friends irl? Invite them to unlock new features:")
                                .font(Font.custom("Inter", size: 14).weight(.medium))
                                .lineSpacing(21)
                                .foregroundColor(Color(red: 0.34, green: 0.35, blue: 0.35))
                                .multilineTextAlignment(.center)
                            
                            ForEach(["Private Mode", "Posting Privileges", "Playback Speed", "Free Downloads", "Higher Video Quality"], id: \.self) { feature in
                                FeatureRow(feature: feature)
                            }
                            
                            HStack(spacing: 8) {
                                Text("+    Invite Friends")
                                    .font(Font.custom("Inter", size: 16).weight(.medium))
                                    .lineSpacing(20)
                                    .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                            }
                            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
                            .frame(width: 280, height: 45)
                            .background(.white)
                            .cornerRadius(6)
                            .padding(.top, 8)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(red: 0.93, green: 0.95, blue: 0.90))
                        .cornerRadius(12)
                        .padding(.horizontal)
                    }
                    
                    
                    // Account
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
                            ForYou(category: "Completed Series", imageURL: "https://images.unsplash.com/photo-1522244451342-a41bf8a13d73?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z3JpbGxpbmd8ZW58MHx8MHx8fDA%3D")
                            ForYou(category: "In Progress", imageURL: "https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dHlwaW5nfGVufDB8fDB8fHww")
                            ForYou(category: "Friends", imageURL: "https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8ZG9nfGVufDB8fDB8fHww")
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
                .padding(.bottom, 80)
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

struct ForYou: View {
    var category: String
    var imageURL: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            VStack(alignment: .leading, spacing: 4) {
                Text(category)
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .foregroundColor(.black)
                    .zIndex(1)
            }
        }
        .padding()
        .frame(width: 120, height: 120)
        .background(
            AsyncImage(url: URL(string: imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .opacity(0.5)
                    .cornerRadius(10)
            } placeholder: {
                Color.gray
                    .cornerRadius(10)
            }
        )
        .cornerRadius(10)
    }
}

struct FeatureRow: View {
    var feature: String
    
    var body: some View {
        HStack(spacing: 16) {
            Text(feature)
                .font(Font.custom("Inter", size: 14))
                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(Color(red: 0.71, green: 0.83, blue: 0.48))
        }
        .padding(EdgeInsets(top: 8, leading: 24, bottom: 8, trailing: 24))
    }
}

// MARK: - Preview Provider
struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
