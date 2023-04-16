import 'package:alok/src/models/ProfileDataProvider.dart';
import 'package:alok/src/models/profile.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatefulWidget {
  final Profile profile;

  const EditProfilePage({Key key,  this.profile}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

  }

}

class _EditProfilePageState extends State<EditProfilePage> {
   Profile _profile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _profile = widget.profile;
    _nameController.text = _profile.name;
    _emailController.text = _profile.email;
    _bioController.text = _profile.bio;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        actions: [
          IconButton(
            onPressed: () {
              Profile updatedProfile = Profile(
                name: _nameController.text,
                email: _emailController.text,
                bio: _bioController.text,
                image: _profile.image,
              );
              ProfileDataProvider.updateProfile(updatedProfile);
              Navigator.pop(context, updatedProfile);
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _bioController,
                decoration: const InputDecoration(
                  labelText: 'Bio',
                ),
                maxLines: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
