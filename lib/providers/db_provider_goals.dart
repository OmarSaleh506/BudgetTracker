import 'package:flutter/material.dart';
import 'package:budget_tracker/constants/colors.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import '../models/goalModel.dart';

class DatabaseProviderGoals {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = 'goals';
  static final String _path = 'goals.db';

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String path = await getDatabasesPath() + _path;
      _db = await openDatabase(path,
          version: _version, onCreate: (db, version) => db.execute('''
          CREATE TABLE $_tableName(
          id STRING PRIMARY KEY,
            goalAmount TEXT, savedAmount TEXT,
            category TEXT, goalAmountLeft TEXT,image TEXT,color TEXT)
        '''));
    } catch (e) {
      Get.snackbar(
        'Error',
        'Error initializing database',
        backgroundColor: Color(0xFF212121),
        colorText: expenseColor,
      );
    }
  }

  static Future<int> insertGoal(GoalModel goals) async {
    return await _db!.insert(_tableName, goals.toMap());
  }

  static Future<int> deleteGoal(String id) async {
    return await _db!.delete(_tableName, where: 'id=?', whereArgs: [id]);
  }

  static Future<int> updateGoal(GoalModel gm) async {
    return await _db!.rawUpdate('''
      UPDATE $_tableName
       SET goalAmount = ?, 
       savedAmount = ?
        WHERE id = ? 
''', [
      gm.goalAmount,
      gm.savedAmount,
      gm.id
    ]);
  }

  //  Future<int> updateGoal(GoalModel goal) async {
  //   int result = await _db!.update(
  //     'users',
  //     goal.toMap(),
  //     where: "id = ?",
  //     whereArgs: [goal.id],
  //   );
  //   return result;
  // }

  static Future<List<Map<String, dynamic>>> queryGoal() async {
    return await _db!.query(_tableName);
  }
}
