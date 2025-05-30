//
//  search.swift
//  treasure
//
//  Created by B Miyamoto on 4/5/25.
//
import SwiftUI

struct Search: View {
    @State private var selectedTab: Tab = .search
    @State private var selectedInterest: String = "Cooking"
    @State private var searchText: String = ""
    @FocusState private var isSearchFocused: Bool

    enum Tab {
        case home, profile, search, post
    }

    let interests = ["Cooking", "Carpentry", "Hygiene", "Taxes", "Budgeting", "Jobs"]
    let reelsData: [String: [(title: String, imageURL: String, username: String)]] = [
        "Cooking": [
            ("Sauteeing", "https://images.unsplash.com/photo-1528712306091-ed0763094c98?q=80&w=3140&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "User123"),
            ("Chopping", "https://images.unsplash.com/photo-1546552916-985b466ffbec?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "ChefMike"),
            ("Boiling Water", "https://images.unsplash.com/photo-1585164422792-a2abebec33bf?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "HealthyEats"),
        ],
        "Carpentry": [
            ("Measuring", "https://images.unsplash.com/photo-1601058268499-e52658b8bb88?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2FycGVudHJ5fGVufDB8fDB8fHww", "Woodworker88"),
            ("Nail Recs", "https://images.unsplash.com/photo-1593307315564-c96172dc89dc?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhcnBlbnRyeXxlbnwwfHwwfHx8MA%3D%3D", "ToolManJoe"),
            ("Best Wood", "https://images.unsplash.com/photo-1520025617835-c638cd05bd8b?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjR8fGNhcnBlbnRyeXxlbnwwfHwwfHx8MA%3D%3D", "Craftsman42"),
        ],
        "Hygiene": [
            ("HowTo Curly Hair", "https://plus.unsplash.com/premium_photo-1729291142531-5e04bd44f4cb?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8d2FzaGluZyUyMGN1cmx5JTIwaGFpcnxlbnwwfHwwfHx8MA%3D%3D", "CleanGuru"),
            ("Flu Hacks", "https://images.unsplash.com/photo-1512069772995-ec65ed45afd6?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bWVkaWNpbmV8ZW58MHx8MHx8fDA%3D", "FreshAndClean"),
            ("Clean a House", "https://plus.unsplash.com/premium_photo-1678304224523-d25b4117558f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGNsZWFuaW5nfGVufDB8fDB8fHww", "HygieneHero"),
        ],
        "Taxes": [
            ("Filing", "https://plus.unsplash.com/premium_photo-1678139620960-5d00a6d7bb81?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8dGF4ZXN8ZW58MHx8MHx8fDA%3D", "TaxExpert1"),
            ("Refunds", "https://images.unsplash.com/photo-1643321610692-719deb378a33?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hhcml0eSUyMHdvcmt8ZW58MHx8MHx8fDA%3D", "RefundKing"),
            ("401K", "https://plus.unsplash.com/premium_photo-1680363254554-d1c63ad8d33d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fDQwMWt8ZW58MHx8MHx8fDA%3D", "TaxGuru99"),
        ],
        "Budgeting": [
            ("Saving Tips", "https://images.unsplash.com/photo-1528712306091-ed0763094c98?q=80&w=3140&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "MoneyMaven"),
            ("Spending Plans", "https://images.unsplash.com/photo-1528712306091-ed0763094c98?q=80&w=3140&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "BudgetBoss"),
            ("Emergency Funds", "https://images.unsplash.com/photo-1528712306091-ed0763094c98?q=80&w=3140&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "FrugalFinder"),
        ],
        "Jobs": [
            ("Interview Prep", "https://images.unsplash.com/photo-1528712306091-ed0763094c98?q=80&w=3140&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "JobSeeker42"),
            ("Resume Tips", "https://images.unsplash.com/photo-1528712306091-ed0763094c98?q=80&w=3140&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "CareerClimber"),
            ("Job Boards", "https://images.unsplash.com/photo-1528712306091-ed0763094c98?q=80&w=3140&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D", "HireMeNow"),
        ]
    ]
    
    let scrollData: [String: [(title: String, imageURL: String)]] = [
        "Parse1": [
            ("Taxes", "https://images.unsplash.com/photo-1554224154-22dec7ec8818?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGZpbGluZyUyMHRheGVzfGVufDB8fDB8fHww"),
            ("Traveling", "https://images.unsplash.com/photo-1542909356-08e5625abea7?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dHJhdmVsaW5nJTIwbWFwfGVufDB8fDB8fHww"),
            ("ThankYou", "https://images.unsplash.com/photo-1554830072-52d78d0d4c18?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHRoYW5rJTIweW91JTIwbm90ZXxlbnwwfHwwfHx8MA%3D%3D"),
            ("Budgeting", "https://plus.unsplash.com/premium_photo-1679496829145-b8407d044a68?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8YnVkZ2V0aW5nfGVufDB8fDB8fHww"),
            ("Engine", "https://images.unsplash.com/photo-1717068341709-df1e2ec06ff8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGNhciUyMGVuZ2luZXxlbnwwfHwwfHx8MA%3D%3D"),
            ("Traveling2", "https://images.unsplash.com/photo-1528543606781-2f6e6857f318?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bGlmZXxlbnwwfHwwfHx8MA%3D%3D"),
            ("Civics", "https://images.unsplash.com/photo-1523995462485-3d171b5c8fa9?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cG9saXRpY3N8ZW58MHx8MHx8fDA%3D"),
            ("SuitAndTie", "https://images.unsplash.com/photo-1606216769783-a7dbe227a17f?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHdlbGwlMjBkcmVzc2VkfGVufDB8fDB8fHww"),
            ("HomeRenovations", "https://images.unsplash.com/photo-1525909002-1b05e0c869d8?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aG91c2UlMjBwYWludGluZ3xlbnwwfHwwfHx8MA%3D%3D")
        ]
    ]

    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        // Search bar
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)

                            TextField(isSearchFocused ? "Search by keyword or categories" : "Search", text: $searchText)
                                .focused($isSearchFocused)
                                .foregroundColor(.primary)

                            if isSearchFocused {
                                Button("Done") {
                                    isSearchFocused = false
                                    searchText = ""
                                }
                                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                            }
                        }
                        .padding(12)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color(red: 0.82, green: 0.83, blue: 0.83), lineWidth: 0.5)
                        )
                        .padding(.horizontal)

                        if !isSearchFocused {
                            // Show rest of UI only when not searching
                            Text("My Interests")
                                .font(Font.custom("Cochin", size: 24).weight(.semibold))
                                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                                .padding(.horizontal)

                            // Interest Tabs
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 12) {
                                    ForEach(interests, id: \.self) { interest in
                                        Text(interest)
                                            .font(.system(size: 14, weight: .medium))
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 16)
                                            .background(selectedInterest == interest ? Color.black : Color(red: 0.85, green: 0.89, blue: 0.76))
                                            .foregroundColor(selectedInterest == interest ? .white : .black)
                                            .cornerRadius(20)
                                            .onTapGesture {
                                                selectedInterest = interest
                                            }
                                    }
                                }
                                .padding(.horizontal)
                            }

                            // Reels
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 16) {
                                    ForEach(reelsData[selectedInterest] ?? [], id: \.title) { reel in
                                        AsyncImage(url: URL(string: reel.imageURL)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                                .frame(width: 140, height: 200)
                                                .cornerRadius(12)
                                                .overlay(
                                                    VStack(alignment: .leading, spacing: 0) { // Remove spacing here
                                                        Text(reel.title)
                                                            .font(.system(size: 14, weight: .medium))
                                                            .foregroundColor(.white)
                                                            .padding(.horizontal)
                                                        
                                                        // Display the username
                                                        Text("@\(reel.username)")
                                                            .font(.system(size: 12, weight: .light))
                                                            .foregroundColor(.white)
                                                            .padding(.horizontal)
                                                            .padding(.bottom, 8)
                                                    },
                                                    alignment: .bottomLeading
                                                )
                                        } placeholder: {
                                            Color.gray // Placeholder while the image is loading
                                                .frame(width: 140, height: 200)
                                                .cornerRadius(12)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }

                            // Button
                            Button(action: {
                                ViewManager.startDoomScrolling(from: "Search")
                            }) {
                                Text("View \(selectedInterest) Reels")
                                    .font(.system(size: 16, weight: .bold))
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color(red: 0.71, green: 0.83, blue: 0.48))
                                    .foregroundColor(.black)
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                            }
                            
                            // Separator
                            Rectangle()
                                .frame(height: 6)
                                .foregroundColor(Color(red: 0.82, green: 0.83, blue: 0.83))
                                .frame(maxWidth: .infinity)
                            
                            // More Reels
                            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                                ForEach(scrollData.flatMap { $0.value }, id: \.title) { item in
                                    VStack(alignment: .leading) {
                                        AsyncImage(url: URL(string: item.imageURL)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            Color.gray.opacity(0.3)
                                        }
                                        .frame(height: 230)
                                        .clipped()
                                        .cornerRadius(12)
                                    }
                                }
                            }
                            .padding(.horizontal)

                                             
                        }
                    }
                    .padding(.top)
                    .padding(.bottom, 80)
                }

                // Bottom Nav Bar
                HStack {
                    Spacer()
                    tabIcon("house.fill", title: "Home", isActive: selectedTab == .home) { selectedTab = .home; ViewManager.lastPage = "Home" }
                    Spacer()
                    tabIcon("plus.circle.fill", title: "Post", isActive: selectedTab == .post) { selectedTab = .post }
                    Spacer()
                    tabIcon("magnifyingglass", title: "Search", isActive: selectedTab == .search) { selectedTab = .search }
                    Spacer()
                    tabIcon("person.fill", title: "Profile", isActive: selectedTab == .profile) { selectedTab = .profile; ViewManager.lastPage = "Profile" }
                    Spacer()
                }
                .padding()
                .background(Color.white)
                .shadow(radius: 5)
            }

            // Search overlay dropdown (covers My Interests)
            if isSearchFocused {
                VStack(spacing: 12) {
                    Spacer().frame(height: 80) // Pushes below search bar
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.gray.opacity(0.4))
                            .frame(height: 1)
                            .edgesIgnoringSafeArea(.horizontal)
                        ForEach(["Cooking", "Filing Taxes", "Street Smarts", "Hygiene", "Nutrition", "Interview Tips"], id: \.self) { category in
                            VStack(spacing: 0) {
                                HStack {
                                    Text(category)
                                        .font(.system(size: 16, weight: .regular))
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                }
                                .padding()

                                Rectangle()
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(height: 1)
                                    .edgesIgnoringSafeArea(.horizontal)
                            }
                        }
                    }
                    .background(Color.white)
                    .transition(.move(edge: .top))
                    Spacer()
                }
            }
        }
    }

    private func tabIcon(_ icon: String, title: String, isActive: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon)
                Text(title).font(.caption)
            }
            .foregroundColor(isActive ? .black : .gray)
        }
    }
}



#Preview {
    Search()
}
