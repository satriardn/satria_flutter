import 'package:satria_flutter/models/profile.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _database;

  // Getter database
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  // Inisialisasi database
  static Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'profile.db');

    return await openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE tb_profile (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            phone TEXT,
            profilePhoto TEXT,
            coverPhoto TEXT,
            quote TEXT,
            desc TEXT
          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          try {
            await db.execute('ALTER TABLE tb_profile ADD COLUMN "desc" TEXT');
          } catch (e) {
            // In case column already exists
          }
        }
      },
    );
  }

  // READ
  static Future<List<Profile>> getProfiles() async {
    final db = await database;

    final List<Map<String, dynamic>> data =
        await db.query('tb_profile');

    return data.map((item) => Profile.fromMap(item)).toList();
  }

  // CREATE
  static Future<int> insertProfile(Profile profile) async {
    final db = await database;

    return await db.insert(
      'tb_profile',
      profile.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // UPDATE
  static Future<int> updateProfile(Profile profile) async {
    final db = await database;

    return await db.update(
      'tb_profile',
      profile.toMap(),
      where: 'id = ?',
      whereArgs: [profile.id12],
    );
  }

  // DELETE
  static Future<int> deleteProfile(int id) async {
    final db = await database;

    return await db.delete(
      'tb_profile',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Close database
  static Future<void> closeDB() async {
    if (_database != null) {
      await _database!.close();
      _database = null;
    }
  }
}