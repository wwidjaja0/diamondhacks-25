//
//  end.swift
//  treasure
//
//  Created by B Miyamoto on 4/5/25.
//

import SwiftUI

struct end: View {
  var body: some View {
    ZStack() {
        //Button to next page
        Button(action: {
            DispatchQueue.main.async {
                ViewManager.signed_in = true
            }
        }) {
            Text("Continue to App")
                .font(Font.custom("Inter", size: 16).weight(.medium))
                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                .padding(.horizontal, 16)
                .frame(height: 48)
                .background(Color(red: 0.71, green: 0.83, blue: 0.48))
                .cornerRadius(4)
        }
        
        
      .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
      .frame(width: 342, height: 48)
      .background(Color(red: 0.71, green: 0.83, blue: 0.48))
      .cornerRadius(6)
      .offset(x: 0, y: 270)
    
        //You're signed up
      VStack(spacing: 12) {
        Text("You’re signed up!")
          .font(Font.custom("Cochin", size: 40).weight(.semibold))
          .lineSpacing(50)
          .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
      }
      .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
      .frame(width: 390)
      .offset(x: 0, y: -103)
    }
    .frame(width: 390, height: 844)
    .background(.white);
  }
}

#Preview {
    end()
}
