import 'package:flutter/material.dart';
import 'package:satria_flutter/models/profile.dart';
import 'package:satria_flutter/screens/detail_profile.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ListProfile extends StatefulWidget {
  const ListProfile({super.key});

  @override
  State<ListProfile> createState() => _ListProfileState();
}

class _ListProfileState extends State<ListProfile> {
  List<Profile> profiles = [];

  void addItem() {
    setState(() {
      int lastIndex = profiles.length;
      profiles.add(
        Profile(
          id12: lastIndex + 1,
          coverphoto12: 'assets/images/background1.jpg',
          profilephoto12:
              'https://scontent.fdps5-1.fna.fbcdn.net/v/t39.30808-1/552277608_1351592173207430_7999390111222818431_n.jpg?stp=c0.0.992.992a_dst-jpg_s200x200_tt6&_nc_cat=103&ccb=1-7&_nc_sid=e99d92&_nc_eui2=AeF5833njfPS8gJoOj7cjI5nPWlADAZA_uw9aUAMBkD-7CVSZDNRU_V2JO30wwTpK9robbI6mPGXXphdADuReEOw&_nc_ohc=hGsg1TEqyBAQ7kNvwF3px1l&_nc_oc=AdrNwk1i3AQxsQpxyDfwSdrhAJ_RmRQjpNB5OR0PEezpi3cgflqxnR8FhZj_X4NzwBY&_nc_zt=24&_nc_ht=scontent.fdps5-1.fna&_nc_gid=GZMJrsLp3Uvyt2BNDixXUA&_nc_ss=7a3a8&oh=00_Af0a6oD2wEVOE8mGgQUa_OPgPpmjCSY1u0suTGEcZkYD4g&oe=69EE014F',
          name12: "Satria ${lastIndex + 1}",
          bio12: "Flutter Deveeloper",
          desc12: "Saya adalah seorang developer yang berkuliah di PNB",
          phonenumber12: "121295228281",
        ),
      );
    });
  }

  void deleteitem(int index) {
    setState(() {
      profiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List profile')),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          final profile = profiles[index];
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              final deletedItem = profiles[index];
              deleteitem(index);
              Fluttertoast.showToast(
                msg: "Profile ${deletedItem.name12} dihapus",
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://ui-avatars.com/api/?name=${profile.name12}',
                ),
              ),
              title: Text(profile.name12),
              subtitle: Text(profile.bio12),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailProfile(profile: profile),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItem();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
