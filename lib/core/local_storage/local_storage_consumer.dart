abstract class LocalStorageConsumer {
  Object? getData({required String key});

  Future<bool> removeDataByKey({required String key});

  Future<bool> saveData({required String key, required dynamic value});

  Future<bool> clearAllCachedData();

  List<String>? getCachedList({required String key});
}
