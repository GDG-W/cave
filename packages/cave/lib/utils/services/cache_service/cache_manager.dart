import 'dart:async';
import 'dart:developer';

import 'cache_item.dart';
import 'cache_store.dart';

final class CacheManager {
  late final CacheStore _store;

  CacheManager._();

  static CacheManager? _instance;

  static CacheManager get instance {
    if (_instance == null) {
      throw ArgumentError('Cache not initialized');
    }
    return _instance!;
  }

  static Future<void> init({required CacheStore store}) async {
    _instance = CacheManager._();
    _instance!._store = store;
    await instance._store.initialiseStore();
  }

  static void close() {
    _instance = null;
  }

  Future<int> cacheVersion() async {
    return await _store.cacheVersion;
  }

  Future<void> updateCacheVersion(int version) async {
    return await _store.updateCacheVersion(version);
  }

  Future<void> set(CacheItem item) async {
    log('setting cache date for ${item.key}');
    return await _store.saveCacheItem(item);
  }

  CacheItem? getSync(String key) {
    final item = _store.getCacheItemSync(key);
    if (item != null) {
      log('returning cache item sync for $key');
    }
    return item;
  }

  bool contains(String key) {
    return _store.containsKey(key);
  }

  Future<void> invalidateCacheItem(String key) async {
    if (!_store.containsKey(key)) {
      return;
    }
    log('invalidating cache item for $key');
    return await _store.invalidateCacheItem(key);
  }

  bool cacheItemExpired(String key) {
    final item = _store.getCacheItemSync(key);
    return item?.isExpired ?? true;
  }

  Future<void> invalidateCache() async {
    log('invalidating all cache items');
    return await _store.invalidateCache();
  }
}
