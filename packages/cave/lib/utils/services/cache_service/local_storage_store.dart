import '../../../cave.dart';

final class LocalStorageStore implements CacheStore {
  late final SharedPreferencesWithCache _store;

  @override
  Future<int> get cacheVersion async => _store.getInt('version') ?? -1;

  @override
  bool containsKey(String key) {
    return _store.containsKey(key);
  }

  @override
  CacheItem? getCacheItemSync(String key) {
    final item = _store.getString(key);
    if (item == null) return null;

    return CacheItem.fromCacheEntryString(item, key: key);
  }

  @override
  Future<void> initialiseStore() async {
    _store = await SharedPreferencesWithCache.create(
        cacheOptions: SharedPreferencesWithCacheOptions());
  }

  @override
  Future<void> invalidateCache() async {
    await _store.clear();
  }

  @override
  Future<void> invalidateCacheItem(String key) async {
    final item = getCacheItemSync(key);
    if (item == null) return;

    return await saveCacheItem(
        item.copyWith(persistenceDuration: const Duration(minutes: -5)));
  }

  @override
  Future<void> saveCacheItem(CacheItem item) async {
    return await _store.setString(item.key, item.toCacheEntryString());
  }

  @override
  Future<void> updateCacheVersion(int version) async {
    return await _store.setInt('version', version);
  }
}
