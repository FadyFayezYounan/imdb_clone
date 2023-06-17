import 'package:flutter/services.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_consumer.dart';

class SharedPrefConsumer implements LocalStorageConsumer {
  final SharedPreferences sharedPreferences;

  SharedPrefConsumer({required this.sharedPreferences});

  @override
  Object? getData({required String key}) {
    return sharedPreferences.get(key);
  }

  @override
  Future<bool> removeDataByKey({required String key}) async {
    try {
      return await sharedPreferences.remove(key);
    } on PlatformException catch (error) {
      throw CachedException(error.toString());
    } catch (error) {
      throw CachedException(error.toString());
    }
  }

  @override
  Future<bool> saveData({required String key, required dynamic value}) async {
    try {
      if (value is int) {
        return await sharedPreferences.setInt(key, value);
      } else if (value is double) {
        return await sharedPreferences.setDouble(key, value);
      } else if (value is bool) {
        return await sharedPreferences.setBool(key, value);
      } else if (value is String) {
        return await sharedPreferences.setString(key, value);
      } else {
        // if value is List<String>
        return await sharedPreferences.setStringList(key, value);
      }
    } on PlatformException catch (error) {
      throw CachedException(error.toString());
    } catch (error) {
      throw CachedException(error.toString());
    }
  }

  @override
  Future<bool> clearAllCachedData() async {
    try {
      return await sharedPreferences.clear();
    } on PlatformException catch (error) {
      throw CachedException(error.toString());
    } catch (error) {
      throw CachedException(error.toString());
    }
  }

  @override
  List<String>? getCachedList({required String key}) {
    return sharedPreferences.getStringList(key);
  }
}
