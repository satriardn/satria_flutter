import 'package:flutter/material.dart';
import '../models/profile.dart';
import '../helpers/db_helper.dart';

class ProfileProvider with ChangeNotifier {
  List<Profile> _profiles = [];
  List<Profile> get profiles => _profiles;

  // READ
  Future<void> fetchProfiles() async {
    try {
      _profiles = await DbHelper.getProfiles();
      notifyListeners();
    } catch (e) {
      debugPrint('Error fetching profiles: $e');
    }
  }

  // CREATE
  Future<void> addProfile(Profile newProfile) async {
    try {
      final insertedId =
          await DbHelper.insertProfile(newProfile);
      final updatedProfile =
          newProfile.copyWith(id12: insertedId);
      _profiles.add(updatedProfile);
      notifyListeners();
    } catch (e) {
      debugPrint('Error adding profile: $e');
    }
  }

  // UPDATE
  Future<void> updateProfile(
      int id,
      Profile profile,
  ) async {
    await DbHelper.updateProfile(profile);
    final index =
        _profiles.indexWhere((p) => p.id12 == id);
    if (index != -1) {
      _profiles[index] = profile;
      notifyListeners();
    }
  }

  // DELETE
  Future<void> deleteProfile(int id) async {
    await DbHelper.deleteProfile(id);
    _profiles.removeWhere((p) => p.id12 == id);
    notifyListeners();
  }
}