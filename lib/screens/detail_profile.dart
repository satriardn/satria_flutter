import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:satria_flutter/models/profile.dart';
import 'package:satria_flutter/screens/edit_profile.dart';

class DetailProfile extends StatefulWidget {
  final Profile profile;

  const DetailProfile({super.key, required this.profile});

  @override
  State<DetailProfile> createState() => _DetailProfileState();
}

class _DetailProfileState extends State<DetailProfile> {
  bool isChanged = false;

  String image1 =
      'https://media.licdn.com/dms/image/v2/D4D03AQEZnAKwF0-jJw/profile-displayphoto-scale_400_400/B4DZkqCnPyJMAg-/0/1757346955547';

  String image2 =
      'https://scontent.fdps7-1.fna.fbcdn.net/v/t39.31212-6/481998712_655847453558515_6296219132735758598_n.jpg';

  late String currentImage;
  late String currentNama;

  @override
  void initState() {
    super.initState();
    currentImage = widget.profile.profilephoto12;
    currentNama = widget.profile.name12;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Detail Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 9, 49, 113),
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
                        image: AssetImage(widget.profile.coverphoto12),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: NetworkImage(widget.profile.profilephoto12),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.profile.name12,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.profile.bio12,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            ),
            SizedBox(height: 10),
              Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.profile.desc12,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.profile.phonenumber12,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.profile.desc12,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 30),

            // ElevatedButton(
            //   onPressed: () {
            //     setState(() {
            //       isChanged = !isChanged;

            //       if (isChanged) {
            //         currentNama = 'Satria Sigma';
            //         currentImage = image2;
            //       } else {
            //         currentNama = widget.profile.name12;
            //         currentImage = image1;
            //       }
            //     });
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: const Color.fromARGB(255, 9, 49, 113),
            //   ),
            //   child: const Text(
            //     'Change',
            //     style: TextStyle(color: Colors.white),
            //   ),
            // ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 9, 49, 113),
              ),
              child: const Text(
                'Back',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final Profile? updatedProfile = await Navigator.push(
                  context,
                MaterialPageRoute(
                builder: (context) =>EditProfile(profile: widget.profile), 
                ),
                  );

                  if (updatedProfile != null) {
                    setState(() {
                      widget.profile.coverphoto12 = updatedProfile.coverphoto12;
                      widget.profile.profilephoto12 = updatedProfile.profilephoto12;
                      widget.profile.name12 = updatedProfile.name12;
                      widget.profile.bio12 = updatedProfile.bio12;
                      widget.profile.phonenumber12 = updatedProfile.phonenumber12;
                      widget.profile.desc12 = updatedProfile.desc12;
                    });
                      Fluttertoast.showToast(msg: "Profile berhasil diperbarui");
                  }
              },
              child: const Text('Edit Profile'),
            )
          ],
        ),
      ),
    );
  }
}