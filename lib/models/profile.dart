class Profile {

  int? id12;
  String coverphoto12;
  String profilephoto12;
  String name12;
  String bio12;
  String desc12;
  String phonenumber12;

  Profile({
    this.id12,
    required this.coverphoto12,
    required this.profilephoto12,
    required this.name12,
    required this.bio12,
    required this.desc12,
    required this.phonenumber12,
  });

  Profile copyWith({
    int? id12,
    String? coverphoto12,
    String? profilephoto12,
    String? name12,
    String? bio12,
    String? desc12,
    String? phonenumber12,
  }) {

    return Profile(
      id12: id12 ?? this.id12,
      coverphoto12:
          coverphoto12 ?? this.coverphoto12,
      profilephoto12:
          profilephoto12 ?? this.profilephoto12,
      name12: name12 ?? this.name12,
      bio12: bio12 ?? this.bio12,
      desc12: desc12 ?? this.desc12,
      phonenumber12:
          phonenumber12 ?? this.phonenumber12,
    );
  }

  factory Profile.fromMap(
      Map<String, dynamic> map) {

    return Profile(
      id12: map['id'],
      coverphoto12:
          map['coverPhoto'] ?? '',
      profilephoto12:
          map['profilePhoto'] ?? '',
      name12: map['name'] ?? '',
      bio12: map['quote'] ?? '',
      desc12: map['desc'] ?? '',
      phonenumber12:
          map['phone'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {

    return {
      'id': id12,
      'coverPhoto': coverphoto12,
      'profilePhoto': profilephoto12,
      'name': name12,
      'quote': bio12,
      'desc': desc12,
      'phone': phonenumber12,
    };
  }
}