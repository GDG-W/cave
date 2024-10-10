import 'cache_item.dart';

abstract interface class CacheStore {
  Future<int> get cacheVersion;

  Future<void> updateCacheVersion(int version);

  Future<void> initialiseStore();

  Future<void> saveCacheItem(CacheItem item);

  CacheItem? getCacheItemSync(String key);

  Future<void> invalidateCacheItem(String key);

  Future<void> invalidateCache();

  bool containsKey(String key);
}
