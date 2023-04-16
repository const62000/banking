import 'package:alok/src/models/ProfileDataProvider.dart';
import 'package:alok/src/models/profile.dart';
import 'package:alok/src/ui/profile/edit_profile_screen.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
   Profile _profile;

  @override
  void initState() {
    super.initState();
    _profile = ProfileDataProvider.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(_profile.image),
              ),
              title: Text(_profile.name),
              subtitle: Text(_profile.email),
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(profile: _profile),
                  ),
                ).then((updatedProfile) {
                  if (updatedProfile != null) {
                    setState(() {
                      _profile = updatedProfile;
                    });
                  }
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Implement logout functionality here.
              },
            ),
          ],
        ),
      ),
    );
  }
}
