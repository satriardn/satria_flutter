import 'package:flutter/material.dart';
import 'package:satria_flutter/models/profile.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.profile});

final Profile profile;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  
  late TextEditingController _coverphotoController;
  late TextEditingController _profilephotoController;
  late TextEditingController _nameController;
  late TextEditingController _bioController;
  late TextEditingController _phonenumberController;
  late TextEditingController _descController;

  @override
  void initState() {
    super.initState();
    _coverphotoController = TextEditingController(text: widget.profile.coverphoto12);
    _profilephotoController = TextEditingController(text: widget.profile.profilephoto12);
    _nameController = TextEditingController(text: widget.profile.name12);
    _bioController = TextEditingController(text: widget.profile.bio12);
    _phonenumberController = TextEditingController(text: widget.profile.phonenumber12);
    _descController = TextEditingController(text: widget.profile.desc12);
  }

  @override
  void dispose() {
    _coverphotoController.dispose();
    _profilephotoController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _phonenumberController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _coverphotoController,
                decoration: InputDecoration(labelText: 'Cover Photo (Local Path)'),
                ),
              TextFormField(
                controller: _profilephotoController,
                decoration: InputDecoration(labelText: 'Profile Photo (Url)'),
                ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Nama'),
                ),
              TextFormField(
                controller: _bioController,
                decoration: InputDecoration(labelText: 'Bio'),
                ),
              TextFormField(
                controller: _phonenumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                ),
              TextFormField(
                controller: _descController,
                decoration: InputDecoration(labelText: 'Description'),
                ),
              ElevatedButton(onPressed: () {
                if (_formKey.currentState!.validate()){
                  final updatedProfile = Profile(
                    coverphoto12:_coverphotoController.text,
                    profilephoto12: _profilephotoController.text,
                    name12: _nameController.text,
                    bio12: _bioController.text,
                    phonenumber12: _phonenumberController.text,
                    desc12: _descController.text,
                    id12: widget.profile.id12,
                  );
                  Navigator.pop(context, updatedProfile);
                }
              },
              child: Text('Simpan')),
            ],
          ), 
          ),
      ),
    );
  }
}