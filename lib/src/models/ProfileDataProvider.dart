import 'package:alok/src/models/profile.dart';

class ProfileDataProvider {
  static Profile getProfile() {
    return Profile(
      name: "John Doe",
      email: "john.doe@example.com",
      bio: "I am a software developer.",
      image: "https://picsum.photos/id/237/200/300",
    );
  }

  static void updateProfile(Profile profile) {
    // Update the profile data in the backend.
  }
}
