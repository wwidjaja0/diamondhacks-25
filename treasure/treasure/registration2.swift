//
//  registration2.swift
//  treasure
//
//  Created by B Miyamoto on 4/5/25.
//

import SwiftUI

struct registration2: View {

    @State private var selectedOptions: Set<String> = []

    let options = ["Cooking", "Laundry", "Nutrition", "General Life Skills"]
    
    var body: some View {
      ZStack {
        VStack(spacing: 0) {
          // Top-aligned content
          VStack(alignment: .leading, spacing: 40) {
            // Learning Goals and Exit
            HStack {
              Text("Learning Goals")
                .font(Font.custom("Inter", size: 14).weight(.semibold))
                .lineSpacing(17.50)
                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
              Spacer()
              Text("Exit")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .lineSpacing(17.50)
                .foregroundColor(Color(red: 0.69, green: 0.70, blue: 0.70))
            }
            .padding(.top, 48)
            .padding(.horizontal, 24)

            // Black Bar
            Rectangle()
              .frame(width: 97.5, height: 4)
              .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
              .padding(.leading, 24)

            // Heading and subtext
              VStack(spacing: 24) {
                  VStack(spacing: 12) {
                    Text("What do you want to learn?")
                      .font(Font.custom("Cochin", size: 24).weight(.semibold))
                      .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                      .multilineTextAlignment(.center)
                      
                    Text("This will help us make a unique experience that is just for you.")
                      .font(Font.custom("Inter", size: 14))
                      .foregroundColor(Color(red: 0.47, green: 0.48, blue: 0.48))
                      .multilineTextAlignment(.center)
                  }
              
            
              .frame(maxWidth: .infinity)
              .padding(.horizontal, 24)
              .padding(.bottom, 24)
                
              
            // Option buttons
                  VStack(alignment: .leading, spacing: 12) {
                      ForEach(options, id: \.self) { option in
                          Button(action: {
                              if selectedOptions.contains(option) {
                                  selectedOptions.remove(option)
                              } else {
                                  selectedOptions.insert(option)
                              }
                          }) {
                              Text(option)
                                  .font(Font.custom("Inter", size: 14).weight(.medium))
                                      .foregroundColor(selectedOptions.contains(option) ? .white : Color(red: 0.21, green: 0.22, blue: 0.22))
                                      .frame(maxWidth: .infinity, minHeight: 48)
                                  .multilineTextAlignment(.center)
                                  .padding(.horizontal, 24)
                                  .background(
                                    selectedOptions.contains(option)
                                    ? Color(red: 0.21, green: 0.22, blue: 0.22)
                                    : Color.white
                                  )
                                  .overlay(
                                    RoundedRectangle(cornerRadius: 100)
                                        .stroke(Color(red: 0.82, green: 0.83, blue: 0.83), lineWidth: 0.5)
                                  )
                                  .cornerRadius(100)
                          }
                      }
                  }
            }
        }
            
        Spacer()
            
            // Bottom Buttons
            HStack(spacing: 12) {
                Button(action: {
                    print("Skip tapped")
                }) {
                    Text("Skip")
                        .font(Font.custom("Inter", size: 14).weight(.medium))
                        .foregroundColor(Color(red: 0.69, green: 0.70, blue: 0.70))
                        .padding(.horizontal, 16)
                        .frame(height: 48)
                        .background(Color.white)
                        .cornerRadius(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                            .stroke(Color(red: 0.82, green: 0.83, blue: 0.83), lineWidth: 0.5)
                        )
                }
                
                Spacer()

                Button(action: {
                    ViewManager.endSignUp()
                }) {
                    HStack(spacing: 8) {
                        Text("Continue")
                            .font(Font.custom("Inter", size: 16).weight(.medium))
                        Text("→")
                            .font(.system(size: 16))
                    }
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .frame(height: 48)
                    .background(Color(red: 0.21, green: 0.22, blue: 0.22))
                    .cornerRadius(6)
                }
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 56)
        }
      }
      
      .background(Color.white)
      .frame(width: 390, height: 844)

  }
}

#Preview {
    registration2()
}
