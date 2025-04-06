import SwiftUI



struct welcomePage: View {
  var body: some View {
    ZStack() {
      Text("WELCOME!!")
        .font(Font.custom("Lora", size: 40).weight(.semibold))
        .lineSpacing(50)
        .foregroundColor(Color(red: 0.12, green: 0.13, blue: 0.14))
        .offset(x: 0, y: -100)
      VStack(spacing: 16) {
        HStack(spacing: 8) {
            Button("Sign Up") {
                ViewManager.startSignUp()
            }
                .font(Font.custom("Inter", size: 16).weight(.medium))
                .lineSpacing(20)
                .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        .frame(height: 48)
        .background(Color(red: 0.71, green: 0.83, blue: 0.48))
        .cornerRadius(6)
        Text("Already have an account?")
          .font(Font.custom("Inter", size: 14).weight(.semibold))
          .lineSpacing(17.50)
          .foregroundColor(Color(red: 0.21, green: 0.22, blue: 0.22))
      }
      .frame(width: 342)
      .offset(x: 0, y: 288)
    }
    .frame(width: 390, height: 844)
    .background(.white);
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    welcomePage()
  }
}
