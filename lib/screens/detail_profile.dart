import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:satria_flutter/models/profile.dart';
import 'package:satria_flutter/provider/profile_provider.dart';
import 'package:satria_flutter/screens/edit_profile.dart';

class DetailProfile extends StatelessWidget {
  final int profileId12;

  const DetailProfile({
    super.key,
    required this.profileId12,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();
    final Profile profile = provider.profiles.firstWhere(
      (p) => p.id12 == profileId12,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          profile.coverphoto12,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(
                        profile.profilephoto12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Consumer<ProfileProvider>(
              builder: (context, provider, child) {
                final currentProfile = provider.profiles.firstWhere(
                  (p) => p.id12 == profileId12,
                );
                return Column(
                  children: [
                    Text(
                      currentProfile.name12,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(currentProfile.bio12),
                    const SizedBox(height: 10),
                    Text("id: ${currentProfile.id12}"),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        currentProfile.desc12,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    Text(currentProfile.phonenumber12),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
            ElevatedButton(
              onPressed: () async {
                final updatedProfile = await Navigator.push<Profile>(
                  context,
                  MaterialPageRoute(
                    builder: (_) => EditProfile(
                      profile: profile,
                    ),
                  ),
                );
                if (updatedProfile != null) {
                  if (!context.mounted) return;
                  final provider = context.read<ProfileProvider>();
                  final index = provider.profiles.indexWhere(
                    (p) => p.id12 == profileId12,
                  );
                  if (index != -1) {
                    provider.updateProfile(profileId12, updatedProfile);
                    Fluttertoast.showToast(
                      msg: "Profile berhasil diperbarui",
                    );
                  }
                }
              },
              child: const Text('Edit Profile'),
            ),
          ],
        ),
      ),
    );
  }
}