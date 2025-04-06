import SwiftUI

struct Registration1: View {
  @State private var profileImage: UIImage?
  @State private var showingImagePicker = false
  @State private var username = ""
  @State private var password = ""
    
  var body: some View {
    ZStack() {
      VStack(spacing:16) {
        VStack(spacing: 24) {
          VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 16) {
              HStack(spacing: 12) {
                Text("Account Setup")
                  .font(Font.custom("Inter", size: 14).weight(.semibold))
                  .lineSpacing(17.50)
                  .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
              }
              Text("Exit")
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .lineSpacing(17.50)
                .foregroundColor(Color(red: 0.69, green: 0.70, blue: 0.70))
            }
            .padding(EdgeInsets(top: 48, leading: 24, bottom: 12, trailing: 24))
            .background(.white)
          }
          VStack(alignment: .leading, spacing: 8) {
            Text("Add a photo:")
              .font(Font.custom("Cochin", size: 30).weight(.semibold))
              .lineSpacing(30)
              .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
          }
          .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
          VStack(spacing: 10) {
            ZStack() {
                // Display the selected image if it exists
                if let image = profileImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .clipped()
                } else {
                    // Placeholder when no image is selected
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                }
            }
          }
          HStack(spacing: 8) {
              Button("Upload Photo") {
                  showingImagePicker = true
              }
              .font(Font.custom("Inter", size: 16).weight(.medium))
              .lineSpacing(20)
              .foregroundColor(.white)
          }
          .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
          .frame(height: 48)
          .background(Color(red: 0.21, green: 0.22, blue: 0.22))
          .cornerRadius(6)
          .sheet(isPresented: $showingImagePicker) {
              ImagePicker(image: $profileImage)
          }
        }
        .frame(height: 436)
          VStack(alignment: .leading, spacing: 4) {
          HStack(spacing: 8) {
            Text("Username")
          }
          HStack(spacing: 4) {
              TextField("Username", text: $username)
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .lineSpacing(17.50)
                .foregroundColor(Color(red: 0.34, green: 0.35, blue: 0.35))
                .submitLabel(.done)
          }
          .onTapGesture {
              // Dismiss keyboard when tapping outside
              UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
          }
          .onSubmit {
              // Dismiss keyboard when "Done" is tapped
              UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
          }
          .padding(EdgeInsets(top: 11, leading: 12, bottom: 11, trailing: 12))
          .frame(height: 48)
          .background(.white)
          .cornerRadius(6)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .inset(by: 0.50)
              .stroke(Color(red: 0.21, green: 0.22, blue: 0.22), lineWidth: 0.50)
          )
        }
        .frame(width: 320)
        VStack(alignment: .leading, spacing: 4) {
          HStack(spacing: 8) {
            Text("Password")
              .font(Font.custom("Inter", size: 14).weight(.medium))
              .lineSpacing(17.50)
              .foregroundColor(Color(red: 0.34, green: 0.35, blue: 0.35))
          }
          HStack(spacing: 4) {
              TextField("Password", text: $password)
                .font(Font.custom("Inter", size: 14).weight(.medium))
                .lineSpacing(17.50)
                .foregroundColor(Color(red: 0.34, green: 0.35, blue: 0.35))
                .submitLabel(.done)
          }
          .onTapGesture {
              // Dismiss keyboard when tapping outside
              UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
          }
          .onSubmit {
              // Dismiss keyboard when "Done" is tapped
              UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                            to: nil,
                                            from: nil,
                                            for: nil)
          }
          .padding(EdgeInsets(top: 11, leading: 12, bottom: 11, trailing: 12))
          .frame(height: 48)
          .background(.white)
          .cornerRadius(6)
          .overlay(
            RoundedRectangle(cornerRadius: 6)
              .inset(by: 0.50)
              .stroke(Color(red: 0.21, green: 0.22, blue: 0.22), lineWidth: 0.50)
          )
        }
        .frame(width: 320)
      }
      .padding(.bottom, 32)
      .frame(width: 390, height: 845)
      .offset(x: 0, y: -70)
        
        // Bottom Buttons
        HStack(spacing: 12) {
            Button(action: {
                print("Back tapped")
            }) {
                Text("Back")
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
                ViewManager.nextRegistrationPage()
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
        
        //erm extra padding?
      .padding(EdgeInsets(top: 12, leading: 24, bottom: 0, trailing: 24))
      .frame(width: 390)
      .background(.white)
      .offset(x: 7, y: 335)
    }
    .frame(width: 390, height: 844)
    .background(.white);
  }
}

#Preview {
    Registration1()
}
